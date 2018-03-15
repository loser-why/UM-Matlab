function setInvKin(params)
%setInvKin: Creates function to evaluate inverse kinematics (x2q) based
%on user supplied definition.
%   Detailed explanation goes here

%% (USER EDIT) Symbolically defined inverse kinematics function

q = sym('q', [2*params.num, 1], 'real'); 
x = sym('x', [6,1], 'real');

% 2 DOF rotation and translation rig
q(1:2:end) = x(3)*ones(params.num,1);  % dl
q(2:2:end) = x(6)*ones(params.num,1);  % dphi


%% Convert symbolic expression to matlab function
matlabFunction(q, 'File', 'x2q', 'Vars', {x});    % this will need to be modified to actually work later

end
