function xdot = arm_1000s_load1_dynamics(in1,u1)
%ARM_1000S_LOAD1_DYNAMICS
%    XDOT = ARM_1000S_LOAD1_DYNAMICS(IN1,U1)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    11-Mar-2019 16:26:06

x1 = in1(1,:);
x2 = in1(2,:);
xdot = [x2;u1.*1.5e1-x1.*1.5e1-x2.*(1.5e1./2.0)+cos(x1).*7.3575];
