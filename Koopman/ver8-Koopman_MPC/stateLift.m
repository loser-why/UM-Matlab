function polyBasis = stateLift(in1)
%STATELIFT
%    POLYBASIS = STATELIFT(IN1)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    07-Dec-2018 14:34:47

ud1 = in1(5,:);
ud2 = in1(6,:);
ud3 = in1(7,:);
x1 = in1(1,:);
x2 = in1(2,:);
xd1 = in1(3,:);
xd2 = in1(4,:);
t2 = x1.^2;
t3 = x2.^2;
t4 = xd1.^2;
t5 = xd2.^2;
t6 = ud1.^2;
t7 = ud2.^2;
t8 = ud3.^2;
polyBasis = [x1;x2;xd1;xd2;ud1;ud2;ud3;t2;x1.*x2;t3;x1.*xd1;x2.*xd1;t4;x1.*xd2;x2.*xd2;xd1.*xd2;t5;ud1.*x1;ud1.*x2;ud1.*xd1;ud1.*xd2;t6;ud2.*x1;ud2.*x2;ud2.*xd1;ud2.*xd2;ud1.*ud2;t7;ud3.*x1;ud3.*x2;ud3.*xd1;ud3.*xd2;ud1.*ud3;ud2.*ud3;t8;t2.*x1;t2.*x2;t3.*x1;t3.*x2;t2.*xd1;x1.*x2.*xd1;t3.*xd1;t4.*x1;t4.*x2;t4.*xd1;t2.*xd2;x1.*x2.*xd2;t3.*xd2;x1.*xd1.*xd2;x2.*xd1.*xd2;t4.*xd2;t5.*x1;t5.*x2;t5.*xd1;t5.*xd2;t2.*ud1;ud1.*x1.*x2;t3.*ud1;ud1.*x1.*xd1;ud1.*x2.*xd1;t4.*ud1;ud1.*x1.*xd2;ud1.*x2.*xd2;ud1.*xd1.*xd2;t5.*ud1;t6.*x1;t6.*x2;t6.*xd1;t6.*xd2;t6.*ud1;t2.*ud2;ud2.*x1.*x2;t3.*ud2;ud2.*x1.*xd1;ud2.*x2.*xd1;t4.*ud2;ud2.*x1.*xd2;ud2.*x2.*xd2;ud2.*xd1.*xd2;t5.*ud2;ud1.*ud2.*x1;ud1.*ud2.*x2;ud1.*ud2.*xd1;ud1.*ud2.*xd2;t6.*ud2;t7.*x1;t7.*x2;t7.*xd1;t7.*xd2;t7.*ud1;t7.*ud2;t2.*ud3;ud3.*x1.*x2;t3.*ud3;ud3.*x1.*xd1;ud3.*x2.*xd1;t4.*ud3;ud3.*x1.*xd2;ud3.*x2.*xd2;ud3.*xd1.*xd2;t5.*ud3;ud1.*ud3.*x1;ud1.*ud3.*x2;ud1.*ud3.*xd1;ud1.*ud3.*xd2;t6.*ud3;ud2.*ud3.*x1;ud2.*ud3.*x2;ud2.*ud3.*xd1;ud2.*ud3.*xd2;ud1.*ud2.*ud3;t7.*ud3;t8.*x1;t8.*x2;t8.*xd1;t8.*xd2;t8.*ud1;t8.*ud2;t8.*ud3;1.0];
