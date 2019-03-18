function xdot = armload_100s_load8_dynamics(in1,u1)
%ARMLOAD_100S_LOAD8_DYNAMICS
%    XDOT = ARMLOAD_100S_LOAD8_DYNAMICS(IN1,U1)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    13-Mar-2019 11:44:53

x1 = in1(1,:);
x2 = in1(2,:);
x3 = in1(3,:);
xdot = [x2;(u1.*2.0e1-x1.*2.0e1-x2.*1.0e1+x3.*cos(x1).*(9.81e2./1.0e2))./(x3+1.0./3.0);0.0];
