function dlift = jacobianLift(in1)
%JACOBIANLIFT
%    DLIFT = JACOBIANLIFT(IN1)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    10-Apr-2019 15:16:32

x1 = in1(1,:);
x2 = in1(2,:);
dlift = reshape([1.0,0.0,x1.*2.0,x2,0.0,0.0,0.0,1.0,0.0,x1,x2.*2.0,0.0],[6,2]);
