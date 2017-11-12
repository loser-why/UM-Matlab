function [zeta, qdot] = moduleBlock( Z, xdot, x, params)
%moduleBlock: Relates actuator torques to module torques.
%   Detailed explanation goes here

p = params.p;   % number of modules in the manipulator
n = params.n;   % number of actuators in each module (a vector)


% Assemble the Jacobian out of Jacobians of each actuator
Jki = zeros(2, 6, max(n));     % Jacobian for all frees combined into single 3d matrix
J = zeros(2*sum(n), 6*p);
for i = 1:p
    xi = x(1+6*(i-1) : 6*i, 1);
        
    for j = 1:n(i)
       Jki(:,:,j) = J_ki(xi, params.attach(i,:), params.L(i));      % Jacobian for each actuator in ith module
       Jk(2*j-1:2*j, :) = Jki(:,:,j);   % Jacobian for the ith module. Stacks actuator Jacobians vertically.
    end
    
    J(2*j-1:2*j, 6*(j-1)+1:6*j) = Jk(:,:);      % Jacobian for the full manipulator. Stacks module Jacobians diagonally.
end

%% set output values
qdot = J * xdot;
zeta = J' * Z;

end
