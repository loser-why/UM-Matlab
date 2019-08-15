classdef mpc
    %mpc: Model predictive controller class
    %   Detailed explanation goes here
    
    properties
        params; % paramaters of the system
        model;  % linear model of the system
        horizon;
        input_bounds;
        input_slopeConst;
        input_smoothConst;
        state_bounds;
        state_shapeConst;
        cost_running;
        cost_terminal;
        cost_input;
        projmtx; % projection matrix from liftes state (z) to reference state   
        cost;   % stores cost matrices
        constraints;    % stores constraint matrices
    end
    
    methods
        function obj = mpc( sysid_class , varargin )
            %mpc: Construct an instance of this class
            %   sysid_class - sysid class object with a model and params
            %    properties
            %   varargin - Name, Value pairs for class properties
            
            % take some properties from the sysid class
            obj.params = sysid_class.params;
            obj.model = sysid_class.model;
            
            % define default values of properties
            obj.horizon = floor( 1 / obj.params.Ts );
            obj.input_bounds = [ -Inf , Inf ];
            obj.input_slopeConst = Inf;
            obj.input_smoothConst = Inf;
            obj.state_bounds = [ -Inf , Inf ];
            obj.state_shapeConst = 'off';
            obj.cost_running = 0.1;
            obj.cost_terminal = 100;
            obj.cost_input = 0;
            obj.projmtx = obj.model.C;   % recovers measured state (could also use Cshape)
            obj.cost = [];
            obj.constraints = [];
            
            % replace default values with user input values
            obj = obj.parse_args( varargin{:} );
        end
        
        % parse_args: Parses the Name, Value pairs in varargin
        function obj = parse_args( obj , varargin )
            %parse_args: Parses the Name, Value pairs in varargin of the
            % constructor, and assigns property values
            for idx = 1:2:length(varargin)
                obj.(varargin{idx}) = varargin{idx+1} ;
            end
        end
        
        % get_matrices: Contructs the matrices for the mpc optim. problem
        function obj = get_costMatrices( obj )
            %get_costMatrices: Constructs the matrices for the mpc optimization
            % problem.
            %   obj.cost has fields H, G, D, L, M, c, A, B, C, Q, R
            
            %% define cost function matrices
            % Cost function is defined: U'HU + ( z0'G + Yr'D )U
            
            model = obj.model;
            
            % A
            N = size(model.A,1);
            A = sparse( N*(obj.horizon+1) , N );
            for i = 0 : obj.horizon
                A( (N*i + 1) : N*(i+1) , : ) = model.A^i ;
            end
            
            % B
            Bheight = N*(obj.horizon+1);
            Bcolwidth = size(model.B,2);
            Bcol = sparse( Bheight , Bcolwidth );    % first column of B matrix
            for i = 1 : obj.horizon
                Bcol( (N*i + 1) : N*(i+1) , : ) = model.A^(i-1) * model.B ;
            end
            
            Lshift = spdiags( ones( N*obj.horizon , 1 ) , -N , N*(obj.horizon+1) , N*(obj.horizon+1) );    % lower shift operator
            
            Bwidth = size(model.B,2)*(obj.horizon);    % total columns in B matrix
            Bblkwidth = obj.horizon;   % how many Bcol blocks wide B matrix is
            B = spalloc( Bheight , Bwidth , floor(Bheight * Bwidth / 2) ); % initialze sparse B matrix
            B(: , 1:Bcolwidth) = Bcol;
            for i = 2 : Bblkwidth
                B(: , (i-1)*Bcolwidth+1 : i*Bcolwidth) = Lshift * B(: , (i-2)*Bcolwidth+1 : (i-1)*Bcolwidth);
            end
            
            % C: matrix that projects lifted state into reference trajectory space
            C = kron( speye(obj.horizon+1) , obj.projmtx);
            nproj = size( obj.projmtx , 1 );
            
            % Q: Error magnitude penalty
            Q = kron( speye(obj.horizon+1) , eye(nproj) * obj.cost_running); % error magnitude penalty (running cost) (default 0.1)
            Q(end-nproj+1 : end , end-nproj+1 : end) = eye(nproj) * obj.cost_terminal;    % (terminal cost) (default 100)
            
            % R: Input magnitude penalty
            R = kron( speye(obj.horizon) , eye(model.params.m) * obj.cost_input );  % input magnitude penalty (for flaccy use 0.5e-2) (new videos used 0.5e-3)
            
            % H, G, D
            H = B' * C' * Q * C * B + R;
            G = 2 * A' * C' * Q * C * B;
            D = -2 * Q * C * B;
            
            % set outputs
            obj.cost.H = H; obj.cost.G = G; obj.cost.D = D;
            obj.cost.A = A; obj.cost.B = B; obj.cost.C = C; obj.cost.Q = Q; obj.cost.R = R;
            
            
        end
        
    end
end

