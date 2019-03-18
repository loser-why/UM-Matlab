function dlift = jacobianLift(in1)
%JACOBIANLIFT
%    DLIFT = JACOBIANLIFT(IN1)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    18-Mar-2019 13:11:42

x1 = in1(1,:);
x2 = in1(2,:);
dlift = reshape([2.0,0.0,x1.*8.0,x2.*4.0,0.0,0.0,0.0,2.0,0.0,x1.*4.0,x2.*8.0,0.0],[6,2]);
