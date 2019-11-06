% mpc_setup.m
%
% Creates an instance of the mpc class bases on user arguments.
% Must have a sysid class in the workspace for this to work

mpc = mpc( sysid_unl ,...
        'horizon' , 10 ,...
        'input_bounds' , [ -Inf , Inf ],... %[ -7*pi/8 , 7*pi/8 ] ,...
        'input_slopeConst' , [1e-2],... %1e-2 ,...
        'input_smoothConst' , [1e-1],... %[1e-1] ,...
        'state_bounds' , [] ,...
        'shape_bounds' , 'off' ,...
        'cost_running' , 0.1 ,...
        'cost_terminal' , 100 ,...
        'cost_input' , 0 ,...
        'projmtx' , eye( sysid_unl.params.nzx ) );