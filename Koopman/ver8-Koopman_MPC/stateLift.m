function fourierBasis = stateLift(in1)
%STATELIFT
%    FOURIERBASIS = STATELIFT(IN1)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    18-Oct-2018 19:15:17

x1 = in1(1,:);
x2 = in1(2,:);
x3 = in1(3,:);
t2 = x1.*pi.*2.0;
t3 = x2.*pi.*2.0;
t4 = x3.*pi.*2.0;
fourierBasis = [x1;x2;x3;1.0;sin(t2);sin(t3);sin(t4);cos(t2);cos(t3);cos(t4)];
