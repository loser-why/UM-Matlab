% main_MPC
%
%
%
%
%

%% load in system model
[model_file , model_path] = uigetfile('./models/');
model = load( [model_path , model_file] );

%% set MPC parameters
mpc = struct;

mpc.Ts      = model.params.Ts;      % sampling time must be the same as discrete model
mpc.tf      = 10;                     % total length of MPC simulation
mpc.tspan   = 0 : mpc.Ts : mpc.tf;  % time vector for MPC simulation
mpc.Np      = 10;                 % prediction horizon


%% define reference trajectory

for i = 1 : length(mpc.tspan)
    ref = [ sin( mpc.tspan(i) ) ; 0 ];
    Yr( (i-1)*model.params.n+1 : i*model.params.n , 1 ) = ref;
end


%% define cost function
% Cost function is defined: U'HU + ( z0'G + Yr'D )U

% A
N = size(model.A,1);
A = sparse( N*(mpc.Np+1) , N );
for i = 0 : mpc.Np
    A( (N*i + 1) : N*(i+1) , : ) = model.A^i ;
end

% B
Bheight = N*(mpc.Np+1);
Bcol = sparse( Bheight , size(model.B,2) );    % first column of B matrix
for i = 1 : mpc.Np
    Bcol( (N*i + 1) : N*(i+1) , : ) = model.A^(i-1) * model.B ;
end

Lshift = spdiags( ones( N*mpc.Np , 1 ) , -N , N*(mpc.Np+1) , N*(mpc.Np+1) );    % lower shift operator

Bwidth = size(model.B,2)*(mpc.Np);
B = spalloc( Bheight , Bwidth , floor(Bheight * Bwidth / 2) ); % initialze sparse B matrix
B(:,1) = Bcol;
for i = 2 : Bwidth
    B(:,i) = Lshift * B(:,i-1);
end

% C
C = kron( speye(mpc.Np+1) , model.C);

% Q
Q = kron( speye(mpc.Np+1) , eye(model.params.n)); % error magnitude penalty

% R
R = kron( speye(mpc.Np) , eye(model.params.p) * 0.01);  % input magnitude penalty

% H, G, D
H = B' * C' * Q * C * B + R;
G = 2 * A' * C' * Q * C * B;
D = -2 * Q * C * B;


%% run MPC simulation