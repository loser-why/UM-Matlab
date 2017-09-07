% setParams.m
%   Set resting values (when P = 0) for state (xrest), and other FREE parameters.
clear
clc

params = struct;

%% USER DEFINED FREE PARAMETERS

params.GamaDeg = 70;  % relaxed fiber angle (deg)
params.R = 0.5e-2;    % relaxed FREE radius (m)
params.L = 10e-2; % relaxed FREE length (m)

params.kelast = [-4e2, -4e-3];   % spring constants for the elastomer

% params.load = [0, 0];   % loads on FREE [Fload, Mload] (N)
params.load = [20, -0.1];   % loads on FREE [Fload, Mload] (N)

params.Ptest = [30, 60, 90, 120, 150]; % pressure(s) at which plots generated (kPa)

% How many points to use for s and w
params.res = 50;

%% Dependent parameters

params.GamaRad = deg2rad(params.GamaDeg);
params.B = params.L/cos(params.GamaRad);   % fiber length
params.N = -params.L/(2*pi*params.R) * tan(params.GamaRad); % total fiber windings in revolutions (when relaxed)




