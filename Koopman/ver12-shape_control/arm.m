classdef arm
    %arm: Class with system properties and equations of motion inside
    %   This is for a planar manipulator arm specifically.
    
    properties
        params struct;  % model parameters
        fcns struct;   % equation of motion functions
    end
    
    methods
        function obj = arm( params )
            %Construct an instance of EOM class
            %   Detailed explanation goes here
            obj.params = params;
            obj.fcns = obj.set_EOM;
        end
        
        %% transformations
        % alpha2theta
        function theta = alpha2theta( obj , alpha )
            %alpha2theta: Converts relative joint angles (alpha) to absolute joint angles (theta).
            
            theta = zeros( size(alpha) );
            
            % if input is symbolic, so should output
            if isa( alpha , 'sym' )
                theta = sym(theta);
            end
            
            for i = 1 : length(alpha)
                theta(i) =  sum(alpha(1:i));
            end
        end
        
        % alpha2xvec (gives x vectorized)
        function [ x , x_cm ] = alpha2xvec( obj , alpha )
            %alpha2xvec: Converts relative joint angles (alpha) to coordinates of joints (x)
            %   and the coordinates of the links' centers of mass (x_cm).
            %   x = [ x_0 ; y_0 ; x_1 ; y_1 ; ... ]
            
            x = zeros( ( obj.params.Nlinks + 1 ) * 2 ,  1 );
            x_cm = zeros( obj.params.Nlinks * 2 , 1 );
            
            % if input is symbolic, so should output
            if isa( alpha , 'sym' )
                x = sym(x);
                x_cm = sym(x_cm);
            end
            
            % convert to absolute joint angles (wrt vertical)
            theta = obj.alpha2theta(alpha);
            
            % convert to coordinates of each joint (note there is 1 more joint than link)
            for i = 1 : length(alpha)
                xim1 = x(2*(i-1)+1 : 2*i, 1);
                x_cm(2*(i-1)+1 : 2*i, 1) = xim1 + obj.params.l/2 * [ sin( theta(i) ) ; cos( theta(i) ) ];
                x(2*i+1 : 2*(i+1), 1) = xim1 + obj.params.l * [ sin( theta(i) ) ; cos( theta(i) ) ];
            end
        end
        
        % alpha2x (gives x where rows are x,y coordinate pairs)
        function [ x , xcm ] = alpha2x( obj , alpha )
            % alpha2x: (gives x where rows are x,y coordinate pairs)
            [ x_vec ,xcm_vec ] = obj.alpha2xvec( alpha );
            x = reshape( x_vec , [ 2 , obj.params.Nlinks+1 ] )';
            xcm = reshape( xcm_vec , [ 2 , obj.params.Nlinks ] )';
        end
        
        % theta2complex (converts an angle to a complex number)
        function complex = theta2complex( obj , theta )
            %theta2complex: Converts an angle relative to y-axis to a point on the complex unit circle
            %   Note that the answer is an array [a b] for the complex number a+ib
            
            a = sin( theta );
            b = cos( theta );
            
            complex = [ a , b ];
        end
        
        % complex_mult (multiply two complex numbers)
        function product = complex_mult( obj , z1 , z2 )
            %complex_mult: Multiply two complex numbers specified as vectors
            
            real = z1(1) * z1(1) - z1(2) * z2(1);
            im = z1(1) * z2(2) + z1(2) * z2(1);
            
            product = [ real , im ];
        end
        
        
        %% equations of motion
        
        % set_EOM
        function fcns = set_EOM(obj)
            %setEOM: Find symbolic expression of the equations of motion
            %   Also saves a function for evaluating the equations of motion
            
            %% define symbolic variables
            alpha = sym('alpha', [obj.params.Nlinks,1], 'real');
            alphadot = sym('alphadot', [obj.params.Nlinks,1], 'real');
            alphaddot = sym('alphaddot', [obj.params.Nlinks,1], 'real');
            
            theta = obj.alpha2theta(alpha);
            thetadot = obj.alpha2theta(alphadot);
            
            [ x , xcm ]= obj.alpha2xvec(alpha);
            
            %% define Jacobians
            
            J_theta_alpha = jacobian( theta , alpha );
            
            J_xcm_alpha = jacobian( xcm , alpha );
            xcmdot = J_xcm_alpha * alphadot;    % velocity of link COMs
            
            %% define useful matrices
            
            % mass matrix
            M = eye(obj.params.Nlinks) * obj.params.m;
            I = eye(obj.params.Nlinks) * obj.params.i;
            K = ones(1 , obj.params.Nlinks) * obj.params.k;
            D = eye(obj.params.Nlinks) * obj.params.d;
            
            %% define Lagrangian (L = KE - PE)
            
            % mass matrix
            Dq = obj.params.m * J_xcm_alpha' * J_xcm_alpha + obj.params.i * J_theta_alpha' * J_theta_alpha;
            
            % kinetic energy
            KE = (1/2) * alphadot' * Dq * alphadot;
            
            % potential energy (needs minus sign since "down" is positive)
            PE = - obj.params.m * obj.params.g * ones(1 , length(xcm)/2) * xcm(2:2:end) + ...
                (1/2) * alpha' * obj.params.k * alpha;
            
            Lagrangian = KE - PE;
            
            %% derive equations of motion
            
            % save mass matrix as a function
            fcns.get_massMatrix = matlabFunction(Dq, 'Vars', { alpha }, 'Optimize', false);
            
            % derive non-inertial part of dynamics
            % creata a variable alpha that is a function of t
            syms t
            alpha_t = zeros( obj.params.Nlinks , 1 );
            alpha_t = sym(alpha_t);
            for i = 1 : obj.params.Nlinks
                istr = num2str(i);
                alpha_t(i) = str2sym(strcat('alpha_t', istr, '(t)'));
            end
            
            % write mass matrix as a function of t
            Dq_t = subs( Dq , alpha , alpha_t );
            
            % differentiate mass matrix wrt t
            Dq_dt = diff( Dq_t , t );
            
            % character substitutions to get rid of all the 'diff(x(t), t)' stuff
            alpha_dt = zeros( obj.params.Nlinks , 1 );
            alpha_dt = sym(alpha_dt);
            for i = 1 : obj.params.Nlinks
                istr = num2str(i);
                alpha_dt(i) = str2sym(strcat( 'diff(alpha_t', istr, '(t), t)' ));
            end
            Dq_dt = subs( Dq_dt , [ alpha_t , alpha_dt ] , [ alpha , alphadot ] ); % replace all t's
            
            dLdalpha = jacobian(Lagrangian, alpha)';
            
            % include damping and input terms
            % damping
            damp = obj.params.d * alphadot;
            fcns.get_damp = matlabFunction(damp, 'Vars', { alphadot }, 'Optimize', false);
            
            % input
            u = sym('u', [obj.params.Nmods,1], 'real'); % input. Desired joint angle for all joints in each module
            input = -obj.params.ku * ( kron( u , ones( obj.params.nlinks , 1) ) - alpha );   % vector of all joint torques
            fcns.get_input = matlabFunction(input, 'Vars', { alpha , u }, 'Optimize', false);
            
            % save damping and input as a function
            dampNinput = damp + input;
            fcns.get_dampNinput = matlabFunction(dampNinput, 'Vars', { alpha , alphadot , u }, 'Optimize', false);
            
            % save non-inertial part of dynamics as a function
            nonInert = Dq_dt * alphadot - dLdalpha + damp + input;
%             nonInert = taylor( nonInert , alpha , 'Order' , 3);  % use taylor series approximation for speed
%             nonInert = taylor( nonInert , alphadot , 'Order' , 3);
            fcns.get_nonInert = matlabFunction(nonInert, 'Vars', { alpha , alphadot , u });
        end
        
        % get_massMatrix
        function Dq = get_massMatrix( obj , alpha )
            Dq = obj.fcns.get_massMatrix(alpha);
        end
        
        % get_nonInert
        function nonInert = get_nonInert( obj , alpha , alphadot , u )
            nonInert = obj.fcns.get_nonInert( alpha , alphadot , u );
        end
        
        % get_damp
        function damp = get_damp( obj , alphadot )
            damp = obj.fcns.get_damp( alphadot );
        end
        
        % get_input
        function input = get_input( obj , alpha , u )
            input = obj.fcns.get_damp( alpha , u );
        end
        
        % get_dampNinput
        function danpNinput = get_dampNinput( obj , alpha , alphadot , u )
            dampNinput = obj.fcns.get_dampNinput( alpha , alphadot , u );
        end
        
        % vf (dynamics as vector field)
        function Alphadot = vf( obj , t , Alpha , u )
            %vf: Explicit dynamics for robot
            %   Alpha = [ alpha ; alphadot ];
            %   Alphadot = [ alphadot ; alphaddot ];
            
            params = obj.params;
            
            alpha = Alpha( 1 : params.Nlinks );
            alphadot = Alpha( params.Nlinks+1 : end );
            
            Dq = obj.get_massMatrix( alpha );
            nonInert = obj.get_nonInert( alpha , alphadot , u );
            
            % solve for acceleration terms
            alphaddot = - Dq \ nonInert;
            
            % define output
            Alphadot = [ alphadot ; alphaddot ];
        end
        
        % vf_RHS (dynamics as vector field)
        function RHS = vf_RHS( obj , t , Alpha , u )
            %vf_RHS: RHS of EoM, Dq(x) * xddot = C(x,xdot) * xdot + g(x)
            % with appropriate dimension to work in state space formulation
            %   Alpha = [ alpha ; alphadot ];
            %   Alphadot = [ alphadot ; alphaddot ];
            %   note: to use with ode45, need to include the mass matrix in
            %         the call to ode45
            
            params = obj.params;
            
            alpha = Alpha( 1 : params.Nlinks );
            alphadot = Alpha( params.Nlinks+1 : end );
            
            nonInert = obj.get_nonInert( alpha , alphadot , u );
            
            RHS = -[ -alphadot ; nonInert ];
        end
        
        % vf_massMatrix (dynamics as vector field)
        function D = vf_massMatrix( obj , t , Alpha , u )
            %vf_massMatrix: mass matrix with appropriate dimension to work 
            % in state space formulation 
            %   Alpha = [ alpha ; alphadot ];
            %   Alphadot = [ alphadot ; alphaddot ];
            %   note: to use with ode45, need to include the mass matrix in
            %         the call to ode45
            
            params = obj.params;
            
            alpha = Alpha( 1 : params.Nlinks );
            alphadot = Alpha( params.Nlinks+1 : end );
            
            Dq = obj.get_massMatrix( alpha );
            
            D = blkdiag( eye(params.Nlinks) , Dq );
        end
        
        %% sensing
        
        % get_markers (simulated mocap)
        function markers = get_markers( obj , alpha )
            [ x , ~ ] = obj.alpha2x( alpha );
            markers = x( 1 : obj.params.nlinks : end , : );
        end
        
        % points2poly (convert marker points into a polynomial)
        function [coeffs, obs_matrix] = points2poly(obj, degree, points, positions, orient)
            %points2poly: Finds polynomial that best goes through a set of points.
            % Polynomial starts at the origin, and its domain is [0,1].
            % "Resting configuration" is along the yaxis (2d) or zaxis (3d)
            %   degree - scalar, maximum degree of the polynomial
            %   points - matrix, rows are xy(z) coordinates of points
            %   positions - (row) vector of [0,1] positions of points on the arm.
            %   orient - (row) vector, orientation of the the end effector (complex number for 2d case, quaternion for 3d case)
            %   coeffs - matrix, rows are the coefficients of the polynomial in each
            %            coordinate where [a b c ...] -> ax^1 + bx^2 + cx^2 + ...
            %   obs_matrix - matrix that converts from state vector to coefficients
            
            % for the 2d case (will consider the 3d case later)
            if size(points,2) == 2
                if all( size(orient) ~= [1,2] )
                    error('orientation for 2d system must be a complex number specified as [1x2] vector');
                end
                
                % generate virtual points to provide slope constraint at the base & end
                startpoint = [ 0 , 1e-2 ];
%                 endpoint = obj.complex_mult( orient/norm(orient) , [ 0 , 1 ] )*1e-2 + points(end,:);  
                endpoint = ( orient/norm(orient) )*1e-2 + points(end,:);    % add point extended from last link
                points_supp = [0 , 0 ; startpoint ; points ; endpoint];
                %     points_supp = points;   % remove the slope constraints
                
                % generate A matrix for least squares problem
                positions_supp = [ 0 , 1e-2 , positions , 1+1e-2 ];
                %     positions_supp = positions;   % remove the slope constraints
                A = zeros( length(positions_supp) , degree );
                for i = 1 : degree
                    A(:,i) = reshape( positions_supp , [] , 1) .^ i;
                end
                
                % separate x and y corrdinates of points
                points_x = points_supp(:,1);
                points_y = points_supp(:,2);
                
                % find polynomial coefficients
                obs_matrix = pinv(A);
                coeffs_vec_x = obs_matrix * points_x;
                coeffs_vec_y = obs_matrix * points_y;
                
                % make coeffs a matrix to where each row is coeffs for one dimension
                coeffs = [ coeffs_vec_x' ; coeffs_vec_y' ];
            else
                error('points matrix must be nx2');
            end
        end
        
        % get_shape
        function [ shape , coeffs ] = get_shape( obj , alpha , degree)
            points = get_markers( obj , alpha );   % coordinates of mocap markers
            positions = obj.params.markerPos;    % relative location of markers on arm [0,1]
            theta = obj.alpha2theta( alpha );
            orient = obj.theta2complex( theta(end) );    % orientaton of end effector
            coeffs = obj.points2poly( degree , points(2:end,:) , positions(2:end) , orient );    % convert points of a polynomial (skip the origin)
            
            % get the shape
            px = fliplr( [ 0 , coeffs(1,:) ] );
            py = fliplr( [ 0 , coeffs(2,:) ] );
            
            pol_x = zeros(101,1); pol_y = zeros(101,1);
            for i = 1:101
                pol_x(i) = polyval(px,0.01*(i-1));
                pol_y(i) = polyval(py,0.01*(i-1));
            end
            shape = [ pol_x , pol_y ];
        end
        
        %% visualization
        
        % def_fig (defines a default figure for plotting arm
        function fig = def_fig( obj )
            %def_fig: set up a figure for plotting
            fig = figure;
            axis([-obj.params.L, obj.params.L, -0.5*obj.params.L, 1.5*obj.params.L])
            set(gca,'Ydir','reverse')
            xlabel('x(m)')
            ylabel('y(m)')
        end
        
        % plot_arm
        function ph = plot_arm( obj , alpha )
            % convert to xy-coordinates
            [ X , ~ ] = obj.alpha2x( alpha );
            x = X(:,1);
            y = X(:,2);
            
            % add markers
            markers = obj.get_markers( alpha );
            
            % plot it
            hold on
            ph(1) = plot( x, y, '-o' );
            ph(2) = plot( markers(:,1) , markers(:,2) , 'r*');
            hold off
        end
        
        % plot_arm_shape
        function ph = plot_arm_shape( obj , alpha , degree )
            % plot the arm
            ph = obj.plot_arm( alpha );
            
            % get the shape
            [ shape , ~ ] = obj.get_shape( alpha , degree );
            
            % plot it
            hold on
            ph(3) = plot( shape(:,1) , shape(:,2) , 'r');
            hold off
        end
        
        % animate_arm
        function animate_arm( obj, t , y , varargin)
            %animate_arm: Animate a simualtion of the arm
            %   t - time vector from simulation
            %   y - state vector from simulation (alpha and alphadot)
            %   varargin{1} = degree - degree of the shape polynomial (default: 3)
            %   varargin{2} = name - name of the video file (default: sysName)
            
            % deal with optional inputs
            if length(varargin) == 2
                degree = varargin{1};
                name = varargin{2};
            elseif length(varargin) == 1
                degree = varargin{1};
                name = obj.params.sysName;
            else
                degree = 3;
                name = obj.params.sysName;
            end
            
            alpha = y(: , 1:obj.params.Nlinks );   % joint angles over time
            
            fig = figure;   % create figure for the animation
            axis([-obj.params.L, obj.params.L, -0.5*obj.params.L, 1.5*obj.params.L])
            set(gca,'Ydir','reverse')
            xlabel('x(m)')
            ylabel('y(m)')
            
            % Prepare the new file.
            vidObj = VideoWriter( ['animations' , filesep , name , '.mp4'] , 'MPEG-4' );
            vidObj.FrameRate = 30;
            open(vidObj);
            
            set(gca,'nextplot','replacechildren', 'FontUnits' , 'normalized');
            
            totTime = t(end);    % total time for animation (s)
            nsteps = length(t); % total steps in the simulation
            totFrames = 30 * totTime;   % total frames in 30 fps video
            
            % run animation fram by frame
            for i = 1:totFrames
                
                index = (i-1) * floor( nsteps / totFrames ) + 1;   % skips points between frames
                
                [ X , ~ ] = obj.alpha2x( alpha(index,:)' );
                x = X(:,1);
                y = X(:,2);
                marker = obj.get_markers( alpha(index,:) );   % get mocap sensor location
                [shape , ~ ] = obj.get_shape( alpha(index,:) , degree); % get polynomial approx of shape (3rd order)
                
                hold on;
                p1 = plot(x, y, 'b-o');
                p2 = plot( marker(:,1) , marker(:,2) , 'r*');
                p3 = plot( shape(:,1) , shape(:,2) , 'r');
                hold off;
                
                % write each frame to the file
                currFrame = getframe(fig);
                writeVideo(vidObj,currFrame);
                
                delete(p1); delete(p2); delete(p3);
            end
            
            close(vidObj);
        end
            
        %% simulation
        
        % simulate system under random "ramp and hold" inputs
        function sim = simulate_arm( obj , tf , Tramp , varargin)
            %simulate_arm: simulate system under random "ramp and hold" inputs
            %   tf - length of simulation(s)
            %   Tramp - ramp period length
            %   Alpha - joint angles and velocities at each timestep
            %   markers - marker position at each time step [x0,y0,...,xn,yn ; ...]
            %   varargin - save on? (true/false)
            
            % save simulation results? Default is no
            if length(varargin) == 1
                saveon = varargin{1};
            else
                saveon = false;
            end
            
            % time steps
            tsteps = ( 0 : obj.params.Ts : tf )';    % all timesteps
            tswitch = ( 0 : Tramp : tf )';  % input switching points
            
            % table of inputs
            numPeriods = ceil( length(tswitch) / 2 );
            inputs_nohold = obj.params.umax .* ( 2*rand( numPeriods , obj.params.Nmods ) - 1 );  % table of random inputs
            inputs_hold = reshape([inputs_nohold(:) inputs_nohold(:)]',2*size(inputs_nohold,1), []); % repeats rows of inputs so that we get a hold between ramps
            u = interp1( tswitch , inputs_hold( 1:length(tswitch) , : ) , tsteps );
            
            % initial condition (resting)
            a0 = zeros( obj.params.Nlinks , 1 );
            adot0 = zeros( obj.params.Nlinks , 1 );
            
            % simulate system
            options = odeset( 'Mass' , @(t,x) obj.vf_massMatrix( t , x , u ) );
            [ t , Alpha ] = ode45( @(t,x) obj.vf_RHS( t , x , u( floor(t/obj.params.Ts) + 1 , : )' ) , tsteps , [ a0 ; adot0 ] , options );    % with mass matrix, variable time step
%             Alpha = ode5( @(t,x) obj.vf( t , x , u( floor(t/obj.params.Ts) + 1 , : )' ) , tsteps , [ a0 ; adot0 ] );  % with numerical inversion, fixed time step
            
            % get locations of the markers at each time step
            markers = zeros( length(t) , 2 * ( obj.params.Nmods+1 ) );
            orient = zeros( length(t) , 2 );
            for i = 1 : size(Alpha,1)
                alpha = Alpha( i , 1 : obj.params.Nlinks );
                theta = obj.alpha2theta( alpha );
                temp = obj.get_markers( alpha );
                markers(i,:) = reshape( temp' , [ 1 , 2 * ( obj.params.Nmods+1 ) ] );
                orient(i,:) = obj.theta2complex( theta(end) ); 
            end
            
            % define output
            sim.t = t;  % time vector
            sim.x = Alpha;  % internal state of the system
            sim.alpha = Alpha( : , 1 : obj.params.Nlinks );   % joint angles
            sim.alphadot = Alpha( : , obj.params.Nlinks+1 : end );  % joint velocities
            sim.y = [ markers( : , 3:end ) , orient ];    % output based on available observations (remove 0th marker position because it is always at the origin)
            sim.u = u;  % input
            sim.params = obj.params;    % parameters associated with the system
            
            % save results
            if saveon
                fname = [ 'systems' , filesep , obj.params.sysName , filesep , 'simulations' , filesep , 'tf-', num2str(tf) , 's_ramp-' , num2str(Tramp) , 's.mat' ];
                unique_fname = auto_rename( fname , '(0)' );
                save( unique_fname , '-struct' ,'sim' );
            end
        end
           
        
    end
end











