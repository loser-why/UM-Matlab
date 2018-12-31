function fourierBasis = stateLift(in1)
%STATELIFT
%    FOURIERBASIS = STATELIFT(IN1)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    31-Dec-2018 18:07:05

ud1 = in1(5,:);
ud2 = in1(6,:);
x1 = in1(1,:);
x2 = in1(2,:);
xd1 = in1(3,:);
xd2 = in1(4,:);
t2 = x1.*pi.*2.0;
t3 = x2.*pi.*2.0;
t4 = xd1.*pi.*2.0;
t5 = xd2.*pi.*2.0;
t6 = ud1.*pi.*2.0;
t7 = ud2.*pi.*2.0;
t8 = sin(t2);
t9 = sin(t3);
t10 = sin(t4);
t11 = sin(t5);
t12 = sin(t6);
t13 = sin(t7);
t14 = cos(t2);
t15 = x1.*pi.*4.0;
t16 = cos(t3);
t17 = x2.*pi.*4.0;
t18 = cos(t4);
t19 = xd1.*pi.*4.0;
t20 = cos(t5);
t21 = xd2.*pi.*4.0;
t22 = cos(t6);
t23 = ud1.*pi.*4.0;
t24 = cos(t7);
t25 = ud2.*pi.*4.0;
fourierBasis = [x1;x2;xd1;xd2;ud1;ud2;1.0;t8;t9;t10;t11;t12;t13;t14;t16;t18;t20;t22;t24;sin(t15);t8.*t9;sin(t17);t8.*t10;t9.*t10;sin(t19);t8.*t11;t9.*t11;t10.*t11;sin(t21);t8.*t12;t9.*t12;t10.*t12;t11.*t12;sin(t23);t8.*t13;t9.*t13;t10.*t13;t11.*t13;t12.*t13;sin(t25);t8.*t14;t9.*t14;t10.*t14;t11.*t14;t12.*t14;t13.*t14;cos(t15);t8.*t16;t9.*t16;t10.*t16;t11.*t16;t12.*t16;t13.*t16;t14.*t16;cos(t17);t8.*t18;t9.*t18;t10.*t18;t11.*t18;t12.*t18;t13.*t18;t14.*t18;t16.*t18;cos(t19);t8.*t20;t9.*t20;t10.*t20;t11.*t20;t12.*t20;t13.*t20;t14.*t20;t16.*t20;t18.*t20;cos(t21);t8.*t22;t9.*t22;t10.*t22;t11.*t22;t12.*t22;t13.*t22;t14.*t22;t16.*t22;t18.*t22;t20.*t22;cos(t23);t8.*t24;t9.*t24;t10.*t24;t11.*t24;t12.*t24;t13.*t24;t14.*t24;t16.*t24;t18.*t24;t20.*t24;t22.*t24;cos(t25)];
