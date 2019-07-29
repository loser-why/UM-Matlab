function out1 = vf_sym(t,in2,u1)
%VF_SYM
%    OUT1 = VF_SYM(T,IN2,U1)

%    This function was generated by the Symbolic Math Toolbox version 8.3.
%    23-Jul-2019 16:36:33

alpha1 = in2(1,:);
alpha2 = in2(2,:);
alphadot1 = in2(3,:);
alphadot2 = in2(4,:);
out1 = [alphadot1;alphadot2;alphadot1.*-1.0e+1+u1-((alpha1.*-3.987683987354748e+37+alpha2.*3.987683987354748e+37+sin(alpha1).*8.801815481088768e+38+cos(alpha1+alpha2).^2.*sin(alpha1).*6.601361610816576e+38+sin(alpha1+alpha2).^2.*sin(alpha1).*2.200453870272192e+38-alpha1.*cos(alpha1+alpha2).^2.*2.990762990516061e+37+alpha2.*cos(alpha1+alpha2).^2.*2.990762990516061e+37-alpha1.*sin(alpha1+alpha2).^2.*2.990762990516061e+37+alpha2.*sin(alpha1+alpha2).^2.*2.990762990516061e+37+alpha2.*cos(alpha1+alpha2).*cos(alpha1).*5.981525981032121e+37+alpha2.*sin(alpha1+alpha2).*sin(alpha1).*5.981525981032121e+37-cos(alpha1+alpha2).*sin(alpha1+alpha2).*cos(alpha1).*4.400907740544384e+38+alphadot1.^2.*cos(alpha1+alpha2).*sin(alpha1).*4.486144485774091e+36-alphadot1.^2.*sin(alpha1+alpha2).*cos(alpha1).*4.486144485774091e+36+alphadot2.^2.*cos(alpha1+alpha2).*sin(alpha1).*4.486144485774091e+36-alphadot2.^2.*sin(alpha1+alpha2).*cos(alpha1).*4.486144485774091e+36+alphadot1.^2.*cos(alpha1+alpha2).^3.*sin(alpha1).*3.364608364330568e+36-alphadot1.^2.*sin(alpha1+alpha2).^3.*cos(alpha1).*3.364608364330568e+36+alphadot2.^2.*cos(alpha1+alpha2).^3.*sin(alpha1).*3.364608364330568e+36-alphadot2.^2.*sin(alpha1+alpha2).^3.*cos(alpha1).*3.364608364330568e+36-alphadot1.^2.*cos(alpha1+alpha2).*sin(alpha1+alpha2).*cos(alpha1).^2.*6.729216728661137e+36-alphadot1.^2.*cos(alpha1+alpha2).^2.*sin(alpha1+alpha2).*cos(alpha1).*3.364608364330568e+36-alphadot2.^2.*cos(alpha1+alpha2).^2.*sin(alpha1+alpha2).*cos(alpha1).*3.364608364330568e+36+alphadot1.^2.*cos(alpha1+alpha2).*sin(alpha1+alpha2).*sin(alpha1).^2.*6.729216728661137e+36+alphadot1.^2.*cos(alpha1+alpha2).*sin(alpha1+alpha2).^2.*sin(alpha1).*3.364608364330568e+36+alphadot2.^2.*cos(alpha1+alpha2).*sin(alpha1+alpha2).^2.*sin(alpha1).*3.364608364330568e+36+alphadot1.*alphadot2.*cos(alpha1+alpha2).*sin(alpha1).*8.972288971548182e+36-alphadot1.*alphadot2.*sin(alpha1+alpha2).*cos(alpha1).*8.972288971548182e+36+alphadot1.^2.*cos(alpha1+alpha2).^2.*cos(alpha1).*sin(alpha1).*6.729216728661137e+36-alphadot1.^2.*sin(alpha1+alpha2).^2.*cos(alpha1).*sin(alpha1).*6.729216728661137e+36+alphadot1.*alphadot2.*cos(alpha1+alpha2).^3.*sin(alpha1).*6.729216728661137e+36-alphadot1.*alphadot2.*sin(alpha1+alpha2).^3.*cos(alpha1).*6.729216728661137e+36-alphadot1.*alphadot2.*cos(alpha1+alpha2).^2.*sin(alpha1+alpha2).*cos(alpha1).*6.729216728661137e+36+alphadot1.*alphadot2.*cos(alpha1+alpha2).*sin(alpha1+alpha2).^2.*sin(alpha1).*6.729216728661137e+36).*2.56e+2)./(cos(alpha1).^2.*2.871132470895418e+39+sin(alpha1).^2.*2.871132470895418e+39+cos(alpha1+alpha2).^2.*cos(alpha1).^2.*4.306698706343127e+38+cos(alpha1+alpha2).^2.*sin(alpha1).^2.*2.153349353171564e+39+sin(alpha1+alpha2).^2.*cos(alpha1).^2.*2.153349353171564e+39+sin(alpha1+alpha2).^2.*sin(alpha1).^2.*4.306698706343127e+38+cos(alpha1+alpha2).^2.*5.742264941790837e+38+sin(alpha1+alpha2).^2.*5.742264941790837e+38-cos(alpha1+alpha2).*sin(alpha1+alpha2).*cos(alpha1).*sin(alpha1).*3.445358965074502e+39+7.656353255721116e+38);alphadot2.*-1.0e+1+u1+((alpha1.*-3.987683987354748e+37+alpha2.*7.975367974709495e+37-sin(alpha1+alpha2).*2.933938493696256e+38+sin(alpha1).*8.801815481088768e+38-sin(alpha1+alpha2).*cos(alpha1).^2.*1.100226935136096e+39+cos(alpha1+alpha2).^2.*sin(alpha1).*6.601361610816576e+38+sin(alpha1+alpha2).*sin(alpha1).^2.*2.200453870272192e+38+sin(alpha1+alpha2).^2.*sin(alpha1).*2.200453870272192e+38-alpha1.*cos(alpha1+alpha2).^2.*2.990762990516061e+37+alpha2.*cos(alpha1+alpha2).^2.*2.990762990516061e+37-alpha1.*sin(alpha1+alpha2).^2.*2.990762990516061e+37+alpha2.*sin(alpha1+alpha2).^2.*2.990762990516061e+37+alpha2.*cos(alpha1).^2.*1.49538149525803e+38+alpha2.*sin(alpha1).^2.*1.49538149525803e+38-alpha1.*cos(alpha1+alpha2).*cos(alpha1).*5.981525981032121e+37+alpha2.*cos(alpha1+alpha2).*cos(alpha1).*1.196305196206424e+38-alpha1.*sin(alpha1+alpha2).*sin(alpha1).*5.981525981032121e+37+alpha2.*sin(alpha1+alpha2).*sin(alpha1).*1.196305196206424e+38-cos(alpha1+alpha2).*sin(alpha1+alpha2).*cos(alpha1).*4.400907740544384e+38+alphadot1.^2.*cos(alpha1+alpha2).*sin(alpha1).*8.972288971548182e+36-alphadot1.^2.*sin(alpha1+alpha2).*cos(alpha1).*8.972288971548182e+36+alphadot2.^2.*cos(alpha1+alpha2).*sin(alpha1).*4.486144485774091e+36-alphadot2.^2.*sin(alpha1+alpha2).*cos(alpha1).*4.486144485774091e+36+cos(alpha1+alpha2).*cos(alpha1).*sin(alpha1).*1.320272322163315e+39+alphadot1.^2.*cos(alpha1+alpha2).*sin(alpha1).^3.*1.682304182165284e+37-alphadot1.^2.*sin(alpha1+alpha2).*cos(alpha1).^3.*1.682304182165284e+37+alphadot1.^2.*cos(alpha1+alpha2).^3.*sin(alpha1).*3.364608364330568e+36-alphadot1.^2.*sin(alpha1+alpha2).^3.*cos(alpha1).*3.364608364330568e+36+alphadot2.^2.*cos(alpha1+alpha2).^3.*sin(alpha1).*3.364608364330568e+36-alphadot2.^2.*sin(alpha1+alpha2).^3.*cos(alpha1).*3.364608364330568e+36-alphadot1.^2.*cos(alpha1+alpha2).*sin(alpha1+alpha2).*cos(alpha1).^2.*1.345843345732227e+37-alphadot1.^2.*cos(alpha1+alpha2).^2.*sin(alpha1+alpha2).*cos(alpha1).*3.364608364330568e+36-alphadot2.^2.*cos(alpha1+alpha2).*sin(alpha1+alpha2).*cos(alpha1).^2.*6.729216728661137e+36-alphadot2.^2.*cos(alpha1+alpha2).^2.*sin(alpha1+alpha2).*cos(alpha1).*3.364608364330568e+36+alphadot1.^2.*cos(alpha1+alpha2).*sin(alpha1+alpha2).*sin(alpha1).^2.*1.345843345732227e+37+alphadot1.^2.*cos(alpha1+alpha2).*sin(alpha1+alpha2).^2.*sin(alpha1).*3.364608364330568e+36+alphadot2.^2.*cos(alpha1+alpha2).*sin(alpha1+alpha2).*sin(alpha1).^2.*6.729216728661137e+36+alphadot2.^2.*cos(alpha1+alpha2).*sin(alpha1+alpha2).^2.*sin(alpha1).*3.364608364330568e+36+alphadot1.*alphadot2.*cos(alpha1+alpha2).*sin(alpha1).*8.972288971548182e+36-alphadot1.*alphadot2.*sin(alpha1+alpha2).*cos(alpha1).*8.972288971548182e+36+alphadot1.^2.*cos(alpha1+alpha2).*cos(alpha1).^2.*sin(alpha1).*1.682304182165284e+37+alphadot1.^2.*cos(alpha1+alpha2).^2.*cos(alpha1).*sin(alpha1).*1.345843345732227e+37+alphadot2.^2.*cos(alpha1+alpha2).^2.*cos(alpha1).*sin(alpha1).*6.729216728661137e+36-alphadot1.^2.*sin(alpha1+alpha2).*cos(alpha1).*sin(alpha1).^2.*1.682304182165284e+37-alphadot1.^2.*sin(alpha1+alpha2).^2.*cos(alpha1).*sin(alpha1).*1.345843345732227e+37-alphadot2.^2.*sin(alpha1+alpha2).^2.*cos(alpha1).*sin(alpha1).*6.729216728661137e+36+alphadot1.*alphadot2.*cos(alpha1+alpha2).^3.*sin(alpha1).*6.729216728661137e+36-alphadot1.*alphadot2.*sin(alpha1+alpha2).^3.*cos(alpha1).*6.729216728661137e+36-alphadot1.*alphadot2.*cos(alpha1+alpha2).*sin(alpha1+alpha2).*cos(alpha1).^2.*1.345843345732227e+37-alphadot1.*alphadot2.*cos(alpha1+alpha2).^2.*sin(alpha1+alpha2).*cos(alpha1).*6.729216728661137e+36+alphadot1.*alphadot2.*cos(alpha1+alpha2).*sin(alpha1+alpha2).*sin(alpha1).^2.*1.345843345732227e+37+alphadot1.*alphadot2.*cos(alpha1+alpha2).*sin(alpha1+alpha2).^2.*sin(alpha1).*6.729216728661137e+36+alphadot1.*alphadot2.*cos(alpha1+alpha2).^2.*cos(alpha1).*sin(alpha1).*1.345843345732227e+37-alphadot1.*alphadot2.*sin(alpha1+alpha2).^2.*cos(alpha1).*sin(alpha1).*1.345843345732227e+37).*2.56e+2)./(cos(alpha1).^2.*2.871132470895418e+39+sin(alpha1).^2.*2.871132470895418e+39+cos(alpha1+alpha2).^2.*cos(alpha1).^2.*4.306698706343127e+38+cos(alpha1+alpha2).^2.*sin(alpha1).^2.*2.153349353171564e+39+sin(alpha1+alpha2).^2.*cos(alpha1).^2.*2.153349353171564e+39+sin(alpha1+alpha2).^2.*sin(alpha1).^2.*4.306698706343127e+38+cos(alpha1+alpha2).^2.*5.742264941790837e+38+sin(alpha1+alpha2).^2.*5.742264941790837e+38-cos(alpha1+alpha2).*sin(alpha1+alpha2).*cos(alpha1).*sin(alpha1).*3.445358965074502e+39+7.656353255721116e+38)];
