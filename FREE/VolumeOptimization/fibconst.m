function fibconst = fibconst(in1)
%FIBCONST
%    FIBCONST = FIBCONST(IN1)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    27-Oct-2017 17:48:18

a0 = in1(:,3);
a1 = in1(:,4);
a2 = in1(:,5);
a3 = in1(:,6);
a4 = in1(:,7);
a5 = in1(:,8);
a6 = in1(:,9);
l = in1(:,1);
phi = in1(:,2);
fibconst = integral(@(x)sqrt((a1+a2.*x.*2.0+a3.*x.^2.*3.0+a4.*x.^3.*4.0+a5.*x.^4.*5.0+a6.*x.^5.*6.0).^2+(1.0./l.^2.*(phi+8.390996311772799).^2-(a1+a2.*x.*2.0+a3.*x.^2.*3.0+a4.*x.^3.*4.0+a5.*x.^4.*5.0+a6.*x.^5.*6.0).^2).*(a0+a1.*x+a2.*x.^2+a3.*x.^3+a4.*x.^4+a5.*x.^5+a6.*x.^6).^2+1.0),0.0,l)-1.305407289332279e-1;
