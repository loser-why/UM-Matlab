function [error, koopsim] = val_liftedSys_wKalman_v2( data, lifted )
%val_liftedSys: Validates the lifted system by comparing simulations to
%validation trials
%   Detailed explanation goes here

% params = data.valparams;    % model parameters
params = lifted.params;

error = struct;     % error results comparing real and koopman system
koopsim = struct;   % simulation results for koopman system

% identify the lifting function
cd('liftingFunctions');
liftState = str2func([ 'lift_' , params.systemName ]);
cd('..');

for j = 1 : params.numVals
    %% real system
     
    % isolate the jth validation trial
    valID = ['val', num2str(j)];
    valdata = data.(valID);
    
    index0 = params.nd + 1;  % index of the first state
    tspan = valdata.t(index0 : end);    % start simulation late so delays can be taken into account
    [treal, xreal] = deal(tspan, valdata.x(index0 : end , :));

    %% simulate the behavior of the learned lifted system
    
    % set initial condition
    x0 = valdata.x(index0 , :)';
    xd0 = reshape( flipud( valdata.x(1 : params.nd , :) )' , [params.n * params.nd , 1] );
    ud0 = reshape( flipud( valdata.u(1 : params.nd , :) )' , [params.p * params.nd , 1] );
    zeta0 = [x0; xd0; ud0];
    
    % simulate the behavior of the discrete linear system
    xdis = zeros(length(tspan) , params.n);
    xdis(1,:) = valdata.x(index0 , :);
    psi0 = liftState(zeta0);
    psi = zeros(length(tspan) , params.N);
    psi(1,:) = psi0;
    psirelift = zeros(length(tspan) , params.N);
    psirelift(1,:) = psi0;
    for i = 1 : length(tspan)-1
        if i == 1
            psik = psi0;
            psireliftk = psi0;
        else
            psik = psikp1;
            psireliftk = liftState(xrelift);
        end
        % linear dynamics
        psikp1 = lifted.A * psik + lifted.B * valdata.u(i,:)' + lifted.W * valdata.w(i,:)';
        xdis(i+1,:) = ( lifted.C * psikp1 )';
        
        % dynamics when relifting at each timestep
        psireliftkp1 = lifted.A * psireliftk + lifted.B * valdata.u(i,:)' + lifted.W * valdata.w(i,:)';
        xrelift = lifted.C * psireliftkp1;
       
        % save psihat so that I can plot it
        psi(i+1,:) = psikp1;
        psirelift(i+1,:) = psireliftkp1';    % the lifted state if you relift at each timestep
    end
    
    %% simulate observer system (Kalman Filter on Observable subsystem)
    
    % Transform into observable form
    Ob = obsv( lifted.A , lifted.Cy );  % observability matrix
    numo = rank( Ob );    % dimension of observable subspace
    To = orth(pinv(Ob));
    Tno = null(Ob);
    T = [ Tno , To ];   % observable decomposition operator
    Tinv = T\eye(size(T)); %inv(T);
    Toinv = Tinv(end-numo+1 : end , :);   % just observable submatrix of Tinv 
    Abar = Tinv * lifted.A * T;
    Bbar = Tinv * lifted.B;
    Cbar = lifted.Cy * T;

%     Ao = Abar(end-numo+1:end , end-numo+1:end);
%     Bo = Bbar(end-numo+1:end , :);
%     Co = Cbar(: , end-numo+1:end );
    Ao = Abar(end-numo+7:end , end-numo+7:end);
    Bo = Bbar(end-numo+7:end , :);
    Co = Cbar(: , end-numo+7:end );
%     Ao = lifted.A;
%     Bo = lifted.B;
%     Co = lifted.Cy;

    % set up Kalman filter on observable subsystem
%     Q = 1e1 * eye(numo); % + 5e0 * ones(numo,numo); % covariance of process noise (set really high because I want filter to be aggressive)
%     R = 0.001 * eye(params.ny);  % covariance of measurement noise
%     P0 = zeros(numo , numo);
    Q = 1e1 * eye(numo-6); % + 5e0 * ones(numo,numo); % covariance of process noise (set really high because I want filter to be aggressive)
    R = 0.001 * eye(params.ny);  % covariance of measurement noise
    P0 = zeros(numo-6 , numo-6);
    
    % simulate observer
    xhat = zeros(length(tspan) , params.n);
    xhat(1,:) = valdata.x(index0 , :) * blkdiag( eye(params.n-1) , 0 );  % Zero the load initially. VERY SPECIFIC TO ARM ROBOT
    psihat0 = liftState(xhat(1,:)');
%     xhat(1,:) = 0.5*ones( 1 , params.n );  % 0.5 initial condition for observer states
%     psihat0 = liftState(xhat(1,:)');   % 0.5 initial condition for observer states
    psihat = zeros(length(tspan) , params.N);
    psihat(1,:) = psihat0;
%     ohat = zeros(length(tspan) , numo);
%     ohat(1,:) = Toinv * psihat0;
%     odis = zeros(length(tspan) , numo);
%     odis(1,:) = Toinv * psi(1,:)';
    ohat = zeros(length(tspan) , numo-6);
    ohat(1,:) = Toinv(end-2:end,:) * psihat0;
    odis = zeros(length(tspan) , numo-6);
    odis(1,:) = Toinv(end-2:end,:) * psi(1,:)';
    oram = zeros(length(tspan) , numo-6);
    oram(1,:) = Toinv(end-2:end,:) * psihat0;
    odisrelift = zeros(length(tspan) , numo-6);
    odisrelift(1,:) = Toinv(end-2:end,:) * psihat0;
    
    hor = 100;
    Oest = zeros(3*hor,1);  % for estimating load
    Ohat = zeros(3*hor,1);  % for estimating load
    for i = 1 : length(tspan)-1
        if i == 1
            psihatk = psihat0;
            Pk = P0;
        else
%             psihatk = liftState(xhat(i,:)');
            psihatk = psihatkp1;
            Pk = Pkp1;
        end
        
        % transform state to observer form
        psibarhatk = Tinv * psihatk; 
%         psibarhatk = psihatk;

        % decompose observable and unobservable states
%         ohatk = psibarhatk(end-numo+1 : end); % isolate the observable states
%         nohatk = psibarhatk(1 : end-numo);  % isolate the unobservable states
        if i == 1
            ohatk = psibarhatk(end-numo+7 : end); % isolate the observable states
            nohatk = psibarhatk(1 : end-numo+6);  % isolate the unobservable states
        else
            ohatk = ohatkp1;    % don't transform and untransform the observable state, just reload it
            nohatk = psibarhatk(1 : end-numo+6);
        end
         
        % Prediction
        ohatkp1_ = Ao * ohatk + Bo * valdata.u(i,:)';
        Pkp1_ = Ao * Pk * Ao' + Q;
        
        % Measurement
        mu = 0; % mean of measurement noise
        sigma = 0.000;  % standard deviation of measurement noise
        ykp1 = xdis(i+1,1:params.ny)' + normrnd(mu,sigma);   % has some noise added in
%         ykp1 = xreal(i+1,1:params.ny)' + normrnd(mu,sigma);   % has some noise added in
%         ykp1 = psirelift(i+1,1:params.ny)' + normrnd(mu,sigma);   % has some noise added in
        
        % Correction
        Kkp1 = Pkp1_ * Co' * inv( Co * Pkp1_ * Co' + R );
        ohatkp1 = ohatkp1_ + Kkp1 * ( ykp1 - Co * ohatkp1_ );
        Pkp1 = ( eye(size(Pk)) - Kkp1 * Co ) * Pkp1_;
        
%         % solve polynomial for x3 using the observable state
%         x3est = fsolve( @(x) func(x,ykp1,ohatkp1,params,Tinv,numo) , 0.5 );
        
        % estimate the regular lifted state using inverse transformation
%         psihatkp1 = T * [ zeros(size(nohatk)) ; ohatkp1 ];   % use zeros for the unobservable states
        psihatkp1 = T * [ nohatk ; ohatkp1 ];   % have to use old unobservable states since we can't update them
%         psihatkp1 = [ nohatk ; ohatkp1 ];
%         psihatkp1 = To * ohatkp1;
%         psihatkp1 = To(end-2:end , :) * ohatkp1;  % recover full lifted state from just the last three "observable state"

%         % Polynomial solver version
%         x3est = fsolve( @(x) sol4x3(x,ykp1,ohatkp1,Toinv(end-2:end,:),params) , 0 );
%         psihatkp1(3) = x3est;
        
%         % Polynomial solver over some horizon of past points using fsolve
%         basest = subs(lifted.params.Basis , { 'x1','x2' } , { ykp1(1) , ykp1(2) });
%         oest = Toinv(end-2:end,:) * basest;
%         Oest = [oest ; Oest(1:3*(hor-1))];
%         Ohat = [ohatkp1 ; Ohat(1:3*(hor-1))];
%         x3est = fsolve( @(x) sol4x3_past(x,Oest,Ohat,params) , psihatkp1(3) );
%         psihatkp1(3) = x3est;
        
%         % Polynomial solver over some horizon of past points using roots function
%         basest = subs(lifted.params.Basis , { 'x1','x2' } , { ykp1(1) , ykp1(2) });
%         oest = Toinv(end-2:end,:) * basest;
%         Oest = [oest ; Oest(1:3*(hor-1))];
%         Ohat = [ohatkp1 ; Ohat(1:3*(hor-1))];
% %         mysym = sum(Oest) - sum(Ohat);    % sum all the equations
%         mysym = Oest(1) - Ohat(1);      % just solve the first equation
%         mypoly = sym2poly(mysym);
%         x3est = roots(mypoly);
%         psihatkp1(3) = min(x3est);  % use the smallest root of the polynomial (the other one is greater than 1)
        
        % Solves by finding minimum of the square sum of equations
        basest = subs(lifted.params.Basis , { 'x1','x2' } , { ykp1(1) , ykp1(2) });
        oest = Toinv(end-2:end,:) * basest;
        Oest = [oest ; Oest(1:3*(hor-1))];
        Ohat = [ohatkp1 ; Ohat(1:3*(hor-1))];
        mysym = sum( (Oest - Ohat).^2 );    % sum the square of all the equations
        myfun = matlabFunction( mysym ) ;
        x3est = fmincon(@(x) myfun(x) , psihatkp1(3) , [] , [] , [] , [] , -0.9 , 0.9);
        psihatkp1(3) = min(x3est);  % use the smallest root of the polynomial (the other one is greater than 1)
        
        % impose saturation limits on state (hopefully will help with observer overshoot/instability) NOT NEEDED WITH KALMAN FILTER
        psihatkp1 = min(psihatkp1, ones(size(psihatkp1)) );   
        psihatkp1 = max(psihatkp1, -ones(size(psihatkp1)) );  % impose saturation limits on state
        
        % update the nonlifted state
        xhatkp1 = lifted.C * psihatkp1;
        xhat(i+1,:) = xhatkp1';
        
        % save psihat so that I can plot it
        psihat(i+1,:) = psihatkp1';
        
        % save ohat and oreal so that I can plot them against eachother (i.e. how well it is observing the so called "observable states"
        ohat(i+1,:) = ohatkp1';
%         odis(i+1,:) = ( Toinv * psi(i+1,:)' )';    % psi is the real lifted state according to the model dynamics (not real dynamics)
        odis(i+1,:) = ( Toinv(end-2:end , :) * psi(i+1,:)' )';    % psi is the real lifted state according to the model dynamics (not real dynamics)
        odisrelift(i+1,:) = ( Toinv(end-2:end , :) * psirelift(i+1,:)' )';    % psi is the real lifted state according to the model dynamics when relifted at each timestep (not real dynamics)
        oram(i+1,:) = ( Toinv(end-2:end , :) * liftState(xhat(i,:)') )' ;
  
    end
    
    
    %% quantify the error between real behavior and simulated behavior
    
%     % quantify error
%     terror = treal;
%     xerror = abs( xreal - xsysid );
% %     xerror = abs( xreal - xkoop );
%     xerrormax = max(max(xerror(:,1:ceil(params.n/2))));
%     % xerrormin = min(min(xerror(:,1:ceil(params.n/2))));
%     RMSE = sqrt( sum( (xreal - xsysid).^2 ) / length(terror) );
    error = 0;
    
    %% define outputs
%     error.(valID).terror = terror;
%     error.(valID).xerror = xerror;
%     error.(valID).RMSE = RMSE;
    
    koopsim.(valID).t = tspan;
%     koopsim.(valID).x = xsysid;       % should make this include both later...
%     koopsim.(valID).x = xss;
    koopsim.(valID).x = xdis;
    koopsim.(valID).xhat = xhat;    % observer output
    koopsim.(valID).xreal = xreal;  % real system behavior
    koopsim.(valID).u = valdata.u(index0 : end , :);
    
    koopsim.(valID).psi = psi;
    koopsim.(valID).psihat = psihat;
    
    koopsim.(valID).psirelift = psirelift;
    
    koopsim.(valID).o = odis;
    koopsim.(valID).orelift = odisrelift;
    koopsim.(valID).ohat = ohat;
    koopsim.(valID).oram = oram;
    
    
    %% plot the results
    
%     if params.ploton
%         figure
%         subplot(3,1,1)
%         plot(treal, xreal(:,1:ceil(params.n)))
%         title('Real system')
%         subplot(3,1,2)
%         plot(tsysid, xsysid(:,1:ceil(params.n)))
%         title('Identified system')
%         subplot(3,1,3)
%         hold on
%         plot(terror, xerror(:,1:ceil(params.n)))
%         plot(terror, xerrormax * ones(size(terror)), '--')
%         title('Error')
%         hold off
%     end

end

end

% function to solve for the load state x3
function fart = sol4x3(x,y,ohat,Toinv,params)
basest = subs( params.Basis, {'x1','x2','x3'} , {y(1),y(2),x} );
basest = double(basest);
oest = Toinv * basest;
fart = sum(oest) - sum(ohat);
end

% function to solve for the load state x3 over all past points
function fart = sol4x3_past(x,oest,ohat,params)
oestx = subs( oest , 'x3' , x );
oestx = double(oestx);
fart = sum(oestx) - sum(ohat);
end

function u = get_u(t, x, valdata, params)
%get_u: Interpolates to estimate the value of the input at a specific t

u = interp1(valdata.t, valdata.u, t)';

end

function delays = get_delays(t, x, valdata, params)
    
    persistent tpast xpast upast
    
    % store the past values of t,x,u at ode solver steps
    if isempty(tpast)
        tpast = valdata.t(1 : params.nd+1);
        xpast = valdata.x(1 : params.nd+1 , :);
        upast = valdata.u(1 : params.nd+1 , :);
    else
        tpast = [tpast ; t];
        xpast = [xpast ; x'];
        upast = [upast ; get_u(t,x,valdata,params)'];
    end
    
    % remove repeated values caused by solver taking small steps
    [tpast_unq, ind_unq] = unique(tpast);
    xpast_unq = xpast(ind_unq, :);
    upast_unq = upast(ind_unq, :);
    
    % interpolate to find values at valid sampling points
    xq = interp1(tpast_unq, xpast_unq, valdata.t, 'linear', 0); % return 0 outside range
    uq = interp1(tpast_unq, upast_unq, valdata.t, 'linear', 0); % return 0 outside range
    
    % exclude values outsite the interpolation range
    xq_sofar = xq( ( xq(:,1) ~= 0 ) , :);
    uq_sofar = uq( ( xq(:,1) ~= 0 ) , :);
    
    % just take the last nd values
    xq_nd = xq_sofar(end-params.nd : end , :);
    uq_nd = uq_sofar(end-params.nd : end , :);
    
    % vectorize
    xd = reshape( flipud( xq_nd(1 : params.nd , :) )' , [params.n * params.nd , 1] );
    ud = reshape( flipud( uq_nd(1 : params.nd , :) )' , [params.p * params.nd , 1] );
    
    % set the output
    delays = [xd; ud];

end