function xdot = arm_1000s_load2_dynamics(in1,u1)
%ARM_1000S_LOAD2_DYNAMICS
%    XDOT = ARM_1000S_LOAD2_DYNAMICS(IN1,U1)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    11-Mar-2019 16:42:13

x1 = in1(1,:);
x2 = in1(2,:);
xdot = [x2;u1.*(6.0e1./7.0)-x1.*(6.0e1./7.0)-x2.*(3.0e1./7.0)+cos(x1).*8.408571428571429];