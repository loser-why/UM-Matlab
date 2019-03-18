function fourierBasis = stateLift(in1)
%STATELIFT
%    FOURIERBASIS = STATELIFT(IN1)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    12-Mar-2019 17:23:50

x1 = in1(1,:);
x2 = in1(2,:);
t2 = x2.*pi.*2.0;
t3 = x2.*pi.*4.0;
t4 = x1.*pi.*2.0;
t5 = cos(t4);
t6 = cos(t2);
t7 = sin(t2);
t8 = cos(t3);
t9 = sin(t3);
t10 = sin(t4);
t11 = x1.*pi.*4.0;
t12 = cos(t11);
t13 = sin(t11);
fourierBasis = [x1;x2;1.0;t6;t7;t8;t9;t5;t5.*t6;t5.*t7;t5.*t8;t5.*t9;t10;t6.*t10;t7.*t10;t8.*t10;t9.*t10;t12;t6.*t12;t7.*t12;t8.*t12;t9.*t12;t13;t6.*t13;t7.*t13;t8.*t13;t9.*t13];
