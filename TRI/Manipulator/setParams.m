function params = setParams(p, n , module, free, sim)
%setParams: Creates parameter struct which holds all parameters related to
%soft manipulator.
%   Inputs:
%       p: number of modules in manipulator
%       n: number of actuators in each module, must be vector of length p
%       module: all parameters related to each module
%       free: all paramters that are related to each actuator
%       sim: simulation parameters

params = struct;

%% Make sure the sizes of inputs are consistent
if size(n,1) ~= p
    error('n must have p rows');
elseif size(module,1) ~= p
    error('Not enough/too many module parameters');
elseif size(free,1) ~= sum(n)
    error('Not enough/too many free parameters');
end


%% MODULE PARAMETERS
% module = [L, block density, EI of spine]

params.L = module(:,1);
params.block = module(:,2);
params.spine = module(:,3);      


%% FREE PARAMETERS
% free = [Gama, R, xattach, yattach]

params.Gama = free(:,1);
params.R = free(:,2);
params.attach = free(:,3:4);
params.xattach = free(:,3);
params.yattach = free(:,4);

% the length of each FREE (determined by length of module it's in)
for i = 1:p
    params.Lfree(sum(n(1:i-1)):sum(n(1:i))) = params.L(i);
end

params.B = abs(params.Lfree ./ cos(params.Gama));   % fiber length (must be positive))
params.Nf = -params.Lfree ./ (2*pi*params.R) .* tan(params.Gama); % total fiber windings in revolutions (when relaxed)


%% SIMULATION PARAMETERS
% EDIT THIS LATER WHEN YOU ARE ACTUALLY GOING TO RUN SIMULATION

% % Initial conditions (could be made more generic in the future)
% params.x0 = [0, 0, 0, 0, 0, 0]';
% params.xdot0 = [params.x0(4), params.x0(5), params.x0(6), 0, 0, 0]';
% params.u0 = [1000, 0, 1000, 0]';
% 
% params.T = 1;   %final time
% params.N = 50; %number of steps
% params.dt = params.T/params.N;    %size of one time step
% params.n = length(params.x0);  %dimension of state vector x
% params.m = length(params.u0);  %dimension of state vector u
% 
% % Maximum pressure for the FREEs
% params.Pmax = 400e3;    % (Pa)


%% VISUALISATION PARAMETERS





        


end
