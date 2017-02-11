%% Calculate dfdx, dfdxdot from f (only the second & third row of f)
% v3: This version has the updated tensions

clear

syms r0 L0 gama0 betta0 P gama betta r L dP dgama dbetta dr dL c1 c2 c3 c4 c5 c6 x u phi dphi nrat

x = [P gama betta r L phi];
xdot = [dP dgama dbetta dr dL dphi];


%% Cases 1 and 2
f12 = [-dP + 0.5*(u - P);...  % The constant in front of (u-P) is arbitrary 
       pi*r^2*dP - c1*dL + 2*pi*P*r*dr + (4*pi*P*r^2*dgama*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3) + (4*pi*P*r^2*dbetta*(2*cot(betta) - cot(gama) - nrat*cot(gama) + cos(pi*(nrat - tan(gama)/tan(betta)))*cot(gama)))/(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3) - (4*pi*cos(gama)*r^2*dP*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(sin(gama)*(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) + (4*pi*cos(gama)*P*r^2*(2*dgama*(cot(gama)^2 + 1) - dbetta*(cot(betta)^2 + 1) + cos((pi*tan(betta))/tan(gama))*dbetta*(cot(betta)^2 + 1) + sin((pi*tan(betta))/tan(gama))*cot(betta)*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2)))/(sin(gama)*(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) - (4*pi*cos(betta)*r^2*dP*(2*cot(betta) - cot(gama) - nrat*cot(gama) + cos(pi*(nrat - tan(gama)/tan(betta)))*cot(gama)))/(sin(betta)*(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) - (4*pi*cos(betta)*P*r^2*(dgama*(cot(gama)^2 + 1) - 2*dbetta*(cot(betta)^2 + 1) - cos(pi*(nrat - tan(gama)/tan(betta)))*dgama*(cot(gama)^2 + 1) + nrat*dgama*(cot(gama)^2 + 1) + pi*cot(gama)*sin(pi*(nrat - tan(gama)/tan(betta)))*(((tan(gama)^2 + 1)*dgama)/tan(betta) - (tan(gama)*(tan(betta)^2 + 1)*dbetta)/tan(betta)^2)))/(sin(betta)*(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) - (4*pi*cos(betta)*P*r^2*(2*cot(betta) - cot(gama) - nrat*cot(gama) + cos(pi*(nrat - tan(gama)/tan(betta)))*cot(gama))*(sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) - pi*sin(pi*(nrat - tan(gama)/tan(betta)))*(((tan(gama)^2 + 1)*dgama)/tan(betta) - (tan(gama)*(tan(betta)^2 + 1)*dbetta)/tan(betta)^2) - sin((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta)))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) + nrat*sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) + pi*cos((pi*tan(betta))/tan(gama))*sin(pi*(nrat - tan(gama)/tan(betta)))*(((tan(gama)^2 + 1)*dgama)/tan(betta) - (tan(gama)*(tan(betta)^2 + 1)*dbetta)/tan(betta)^2)))/(sin(betta)*(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3)^2) + (4*pi*cos(gama)^2*P*r^2*dgama*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(sin(gama)^2*(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) + (4*pi*cos(betta)^2*P*r^2*dbetta*(2*cot(betta) - cot(gama) - nrat*cot(gama) + cos(pi*(nrat - tan(gama)/tan(betta)))*cot(gama)))/(sin(betta)^2*(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) - (8*pi*cos(gama)*P*r*dr*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(sin(gama)*(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) - (8*pi*cos(betta)*P*r*dr*(2*cot(betta) - cot(gama) - nrat*cot(gama) + cos(pi*(nrat - tan(gama)/tan(betta)))*cot(gama)))/(sin(betta)*(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) - (4*pi*cos(gama)*P*r^2*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta))*(sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) - pi*sin(pi*(nrat - tan(gama)/tan(betta)))*(((tan(gama)^2 + 1)*dgama)/tan(betta) - (tan(gama)*(tan(betta)^2 + 1)*dbetta)/tan(betta)^2) - sin((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta)))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) + nrat*sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) + pi*cos((pi*tan(betta))/tan(gama))*sin(pi*(nrat - tan(gama)/tan(betta)))*(((tan(gama)^2 + 1)*dgama)/tan(betta) - (tan(gama)*(tan(betta)^2 + 1)*dbetta)/tan(betta)^2)))/(sin(gama)*(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3)^2);...
       ((4*pi*P*r^2*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3) + (4*pi*P*r^2*(2*cot(betta) - cot(gama) - nrat*cot(gama) + cos(pi*(nrat - tan(gama)/tan(betta)))*cot(gama)))/(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3))*dr - c4*dphi + r*((4*pi*r^2*dP*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3) - (4*pi*P*r^2*(2*dgama*(cot(gama)^2 + 1) - dbetta*(cot(betta)^2 + 1) + cos((pi*tan(betta))/tan(gama))*dbetta*(cot(betta)^2 + 1) + sin((pi*tan(betta))/tan(gama))*cot(betta)*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2)))/(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3) + (4*pi*r^2*dP*(2*cot(betta) - cot(gama) - nrat*cot(gama) + cos(pi*(nrat - tan(gama)/tan(betta)))*cot(gama)))/(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3) + (4*pi*P*r^2*(dgama*(cot(gama)^2 + 1) - 2*dbetta*(cot(betta)^2 + 1) - cos(pi*(nrat - tan(gama)/tan(betta)))*dgama*(cot(gama)^2 + 1) + nrat*dgama*(cot(gama)^2 + 1) + pi*cot(gama)*sin(pi*(nrat - tan(gama)/tan(betta)))*(((tan(gama)^2 + 1)*dgama)/tan(betta) - (tan(gama)*(tan(betta)^2 + 1)*dbetta)/tan(betta)^2)))/(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3) + (4*pi*P*r^2*(2*cot(betta) - cot(gama) - nrat*cot(gama) + cos(pi*(nrat - tan(gama)/tan(betta)))*cot(gama))*(sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) - pi*sin(pi*(nrat - tan(gama)/tan(betta)))*(((tan(gama)^2 + 1)*dgama)/tan(betta) - (tan(gama)*(tan(betta)^2 + 1)*dbetta)/tan(betta)^2) - sin((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta)))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) + nrat*sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) + pi*cos((pi*tan(betta))/tan(gama))*sin(pi*(nrat - tan(gama)/tan(betta)))*(((tan(gama)^2 + 1)*dgama)/tan(betta) - (tan(gama)*(tan(betta)^2 + 1)*dbetta)/tan(betta)^2)))/(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3)^2 + (8*pi*P*r*dr*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3) + (8*pi*P*r*dr*(2*cot(betta) - cot(gama) - nrat*cot(gama) + cos(pi*(nrat - tan(gama)/tan(betta)))*cot(gama)))/(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3) + (4*pi*P*r^2*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta))*(sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) - pi*sin(pi*(nrat - tan(gama)/tan(betta)))*(((tan(gama)^2 + 1)*dgama)/tan(betta) - (tan(gama)*(tan(betta)^2 + 1)*dbetta)/tan(betta)^2) - sin((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta)))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) + nrat*sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) + pi*cos((pi*tan(betta))/tan(gama))*sin(pi*(nrat - tan(gama)/tan(betta)))*(((tan(gama)^2 + 1)*dgama)/tan(betta) - (tan(gama)*(tan(betta)^2 + 1)*dbetta)/tan(betta)^2)))/(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3)^2);...
       dL/cos(gama) + ((phi - (L0*tan(gama0))/r0)*dr)/sin(gama) + (r*dphi)/sin(gama) + (sin(gama)*L*dgama)/cos(gama)^2 - (cos(gama)*r*(phi - (L0*tan(gama0))/r0)*dgama)/sin(gama)^2;...
       dL/cos(betta) + ((phi - (L0*tan(betta0))/r0)*dr)/sin(betta) + (r*dphi)/sin(betta) + (sin(betta)*L*dbetta)/cos(betta)^2 - (cos(betta)*r*(phi - (L0*tan(betta0))/r0)*dbetta)/sin(betta)^2;...
       (tan(gama)*L*dr)/r^2 - (tan(gama)*dL)/r - (L*(tan(gama)^2 + 1)*dgama)/r - dphi];

%% Cases 3 and 4
f34 = [-dP + 0.5*(u - P);...  % The constant in front of (u-P) is arbitrary 
       pi*r^2*dP - c1*dL + 2*pi*P*r*dr + (4*pi*P*r^2*dgama*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3) + (4*pi*P*r^2*dbetta*(2*cot(betta) - cot(gama) - nrat*cot(gama) + cos(pi*(nrat - tan(gama)/tan(betta)))*cot(gama)))/(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3) - (4*pi*cos(gama)*r^2*dP*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(sin(gama)*(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) + (4*pi*cos(gama)*P*r^2*(2*dgama*(cot(gama)^2 + 1) - dbetta*(cot(betta)^2 + 1) + cos((pi*tan(betta))/tan(gama))*dbetta*(cot(betta)^2 + 1) + sin((pi*tan(betta))/tan(gama))*cot(betta)*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2)))/(sin(gama)*(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) - (4*pi*cos(betta)*r^2*dP*(2*cot(betta) - cot(gama) - nrat*cot(gama) + cos(pi*(nrat - tan(gama)/tan(betta)))*cot(gama)))/(sin(betta)*(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) - (4*pi*cos(betta)*P*r^2*(dgama*(cot(gama)^2 + 1) - 2*dbetta*(cot(betta)^2 + 1) - cos(pi*(nrat - tan(gama)/tan(betta)))*dgama*(cot(gama)^2 + 1) + nrat*dgama*(cot(gama)^2 + 1) + pi*cot(gama)*sin(pi*(nrat - tan(gama)/tan(betta)))*(((tan(gama)^2 + 1)*dgama)/tan(betta) - (tan(gama)*(tan(betta)^2 + 1)*dbetta)/tan(betta)^2)))/(sin(betta)*(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) - (4*pi*cos(betta)*P*r^2*(2*cot(betta) - cot(gama) - nrat*cot(gama) + cos(pi*(nrat - tan(gama)/tan(betta)))*cot(gama))*(sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) - pi*sin(pi*(nrat - tan(gama)/tan(betta)))*(((tan(gama)^2 + 1)*dgama)/tan(betta) - (tan(gama)*(tan(betta)^2 + 1)*dbetta)/tan(betta)^2) - sin((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta)))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) + nrat*sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) + pi*cos((pi*tan(betta))/tan(gama))*sin(pi*(nrat - tan(gama)/tan(betta)))*(((tan(gama)^2 + 1)*dgama)/tan(betta) - (tan(gama)*(tan(betta)^2 + 1)*dbetta)/tan(betta)^2)))/(sin(betta)*(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3)^2) + (4*pi*cos(gama)^2*P*r^2*dgama*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(sin(gama)^2*(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) + (4*pi*cos(betta)^2*P*r^2*dbetta*(2*cot(betta) - cot(gama) - nrat*cot(gama) + cos(pi*(nrat - tan(gama)/tan(betta)))*cot(gama)))/(sin(betta)^2*(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) - (8*pi*cos(gama)*P*r*dr*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(sin(gama)*(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) - (8*pi*cos(betta)*P*r*dr*(2*cot(betta) - cot(gama) - nrat*cot(gama) + cos(pi*(nrat - tan(gama)/tan(betta)))*cot(gama)))/(sin(betta)*(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) - (4*pi*cos(gama)*P*r^2*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta))*(sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) - pi*sin(pi*(nrat - tan(gama)/tan(betta)))*(((tan(gama)^2 + 1)*dgama)/tan(betta) - (tan(gama)*(tan(betta)^2 + 1)*dbetta)/tan(betta)^2) - sin((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta)))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) + nrat*sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) + pi*cos((pi*tan(betta))/tan(gama))*sin(pi*(nrat - tan(gama)/tan(betta)))*(((tan(gama)^2 + 1)*dgama)/tan(betta) - (tan(gama)*(tan(betta)^2 + 1)*dbetta)/tan(betta)^2)))/(sin(gama)*(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3)^2);...
       ((4*pi*P*r^2*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3) + (4*pi*P*r^2*(2*cot(betta) - cot(gama) - nrat*cot(gama) + cos(pi*(nrat - tan(gama)/tan(betta)))*cot(gama)))/(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3))*dr - c4*dphi + r*((4*pi*r^2*dP*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3) - (4*pi*P*r^2*(2*dgama*(cot(gama)^2 + 1) - dbetta*(cot(betta)^2 + 1) + cos((pi*tan(betta))/tan(gama))*dbetta*(cot(betta)^2 + 1) + sin((pi*tan(betta))/tan(gama))*cot(betta)*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2)))/(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3) + (4*pi*r^2*dP*(2*cot(betta) - cot(gama) - nrat*cot(gama) + cos(pi*(nrat - tan(gama)/tan(betta)))*cot(gama)))/(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3) + (4*pi*P*r^2*(dgama*(cot(gama)^2 + 1) - 2*dbetta*(cot(betta)^2 + 1) - cos(pi*(nrat - tan(gama)/tan(betta)))*dgama*(cot(gama)^2 + 1) + nrat*dgama*(cot(gama)^2 + 1) + pi*cot(gama)*sin(pi*(nrat - tan(gama)/tan(betta)))*(((tan(gama)^2 + 1)*dgama)/tan(betta) - (tan(gama)*(tan(betta)^2 + 1)*dbetta)/tan(betta)^2)))/(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3) + (4*pi*P*r^2*(2*cot(betta) - cot(gama) - nrat*cot(gama) + cos(pi*(nrat - tan(gama)/tan(betta)))*cot(gama))*(sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) - pi*sin(pi*(nrat - tan(gama)/tan(betta)))*(((tan(gama)^2 + 1)*dgama)/tan(betta) - (tan(gama)*(tan(betta)^2 + 1)*dbetta)/tan(betta)^2) - sin((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta)))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) + nrat*sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) + pi*cos((pi*tan(betta))/tan(gama))*sin(pi*(nrat - tan(gama)/tan(betta)))*(((tan(gama)^2 + 1)*dgama)/tan(betta) - (tan(gama)*(tan(betta)^2 + 1)*dbetta)/tan(betta)^2)))/(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3)^2 + (8*pi*P*r*dr*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3) + (8*pi*P*r*dr*(2*cot(betta) - cot(gama) - nrat*cot(gama) + cos(pi*(nrat - tan(gama)/tan(betta)))*cot(gama)))/(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3) + (4*pi*P*r^2*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta))*(sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) - pi*sin(pi*(nrat - tan(gama)/tan(betta)))*(((tan(gama)^2 + 1)*dgama)/tan(betta) - (tan(gama)*(tan(betta)^2 + 1)*dbetta)/tan(betta)^2) - sin((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta)))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) + nrat*sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) + pi*cos((pi*tan(betta))/tan(gama))*sin(pi*(nrat - tan(gama)/tan(betta)))*(((tan(gama)^2 + 1)*dgama)/tan(betta) - (tan(gama)*(tan(betta)^2 + 1)*dbetta)/tan(betta)^2)))/(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3)^2);...
       dL/cos(gama) + ((phi - (L0*tan(gama0))/r0)*dr)/sin(gama) + (r*dphi)/sin(gama) + (sin(gama)*L*dgama)/cos(gama)^2 - (cos(gama)*r*(phi - (L0*tan(gama0))/r0)*dgama)/sin(gama)^2;...
       dL/cos(betta) + ((phi - (L0*tan(betta0))/r0)*dr)/sin(betta) + (r*dphi)/sin(betta) + (sin(betta)*L*dbetta)/cos(betta)^2 - (cos(betta)*r*(phi - (L0*tan(betta0))/r0)*dbetta)/sin(betta)^2;...
       (tan(gama)*L*dr)/r^2 - (tan(gama)*dL)/r - (L*(tan(gama)^2 + 1)*dgama)/r - dphi];

%% Cases 5 and 6
f56 = [-dP + 0.5*(u - P);...  % The constant in front of (u-P) is arbitrary 
       pi*r^2*dP - c1*dL + 2*pi*P*r*dr + (4*pi*P*r^2*dgama*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3) - (4*pi*P*r^2*dbetta*(cot(gama) - 2*cot(betta) + nrat*cot(gama)))/(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3) - (4*pi*cos(betta)*P*r^2*(dgama*(cot(gama)^2 + 1) - 2*dbetta*(cot(betta)^2 + 1) + nrat*dgama*(cot(gama)^2 + 1)))/(sin(betta)*(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) + (4*pi*cos(betta)*r^2*dP*(cot(gama) - 2*cot(betta) + nrat*cot(gama)))/(sin(betta)*(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) - (4*pi*cos(gama)*r^2*dP*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(sin(gama)*(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) + (4*pi*cos(gama)*P*r^2*(2*dgama*(cot(gama)^2 + 1) - dbetta*(cot(betta)^2 + 1) + cos((pi*tan(betta))/tan(gama))*dbetta*(cot(betta)^2 + 1) + sin((pi*tan(betta))/tan(gama))*cot(betta)*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2)))/(sin(gama)*(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) - (4*pi*cos(betta)^2*P*r^2*dbetta*(cot(gama) - 2*cot(betta) + nrat*cot(gama)))/(sin(betta)^2*(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) + (4*pi*cos(gama)^2*P*r^2*dgama*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(sin(gama)^2*(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) + (8*pi*cos(betta)*P*r*dr*(cot(gama) - 2*cot(betta) + nrat*cot(gama)))/(sin(betta)*(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) - (8*pi*cos(gama)*P*r*dr*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(sin(gama)*(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) + (4*pi*cos(betta)*P*r^2*(sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) + nrat*sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2))*(cot(gama) - 2*cot(betta) + nrat*cot(gama)))/(sin(betta)*(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3)^2) - (4*pi*cos(gama)*P*r^2*(sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) + nrat*sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2))*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(sin(gama)*(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3)^2);...
       r*((4*pi*P*r^2*(dgama*(cot(gama)^2 + 1) - 2*dbetta*(cot(betta)^2 + 1) + nrat*dgama*(cot(gama)^2 + 1)))/(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3) + (4*pi*r^2*dP*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3) - (4*pi*r^2*dP*(cot(gama) - 2*cot(betta) + nrat*cot(gama)))/(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3) - (4*pi*P*r^2*(2*dgama*(cot(gama)^2 + 1) - dbetta*(cot(betta)^2 + 1) + cos((pi*tan(betta))/tan(gama))*dbetta*(cot(betta)^2 + 1) + sin((pi*tan(betta))/tan(gama))*cot(betta)*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2)))/(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3) + (8*pi*P*r*dr*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3) - (8*pi*P*r*dr*(cot(gama) - 2*cot(betta) + nrat*cot(gama)))/(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3) + (4*pi*P*r^2*(sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) + nrat*sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2))*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3)^2 - (4*pi*P*r^2*(sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) + nrat*sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2))*(cot(gama) - 2*cot(betta) + nrat*cot(gama)))/(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3)^2) + ((4*pi*P*r^2*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3) - (4*pi*P*r^2*(cot(gama) - 2*cot(betta) + nrat*cot(gama)))/(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3))*dr - c4*dphi;...
       dL/cos(gama) + ((phi - (L0*tan(gama0))/r0)*dr)/sin(gama) + (r*dphi)/sin(gama) + (sin(gama)*L*dgama)/cos(gama)^2 - (cos(gama)*r*(phi - (L0*tan(gama0))/r0)*dgama)/sin(gama)^2;...
       dL/cos(betta) + ((phi - (L0*tan(betta0))/r0)*dr)/sin(betta) + (r*dphi)/sin(betta) + (sin(betta)*L*dbetta)/cos(betta)^2 - (cos(betta)*r*(phi - (L0*tan(betta0))/r0)*dbetta)/sin(betta)^2;...
       (tan(gama)*L*dr)/r^2 - (tan(gama)*dL)/r - (L*(tan(gama)^2 + 1)*dgama)/r - dphi];

%% Cases 7 and 8
f78 = [-dP + 0.5*(u - P);...  % The constant in front of (u-P) is arbitrary  
       pi*r^2*dP - c1*dL + 2*pi*P*r*dr + (4*pi*P*r^2*dgama*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3) - (4*pi*P*r^2*dbetta*(cot(gama) - 2*cot(betta) + nrat*cot(gama)))/(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3) - (4*pi*cos(betta)*P*r^2*(dgama*(cot(gama)^2 + 1) - 2*dbetta*(cot(betta)^2 + 1) + nrat*dgama*(cot(gama)^2 + 1)))/(sin(betta)*(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) + (4*pi*cos(betta)*r^2*dP*(cot(gama) - 2*cot(betta) + nrat*cot(gama)))/(sin(betta)*(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) - (4*pi*cos(gama)*r^2*dP*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(sin(gama)*(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) + (4*pi*cos(gama)*P*r^2*(2*dgama*(cot(gama)^2 + 1) - dbetta*(cot(betta)^2 + 1) + cos((pi*tan(betta))/tan(gama))*dbetta*(cot(betta)^2 + 1) + sin((pi*tan(betta))/tan(gama))*cot(betta)*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2)))/(sin(gama)*(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) - (4*pi*cos(betta)^2*P*r^2*dbetta*(cot(gama) - 2*cot(betta) + nrat*cot(gama)))/(sin(betta)^2*(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) + (4*pi*cos(gama)^2*P*r^2*dgama*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(sin(gama)^2*(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) + (8*pi*cos(betta)*P*r*dr*(cot(gama) - 2*cot(betta) + nrat*cot(gama)))/(sin(betta)*(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) - (8*pi*cos(gama)*P*r*dr*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(sin(gama)*(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3)) + (4*pi*cos(betta)*P*r^2*(sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) + nrat*sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2))*(cot(gama) - 2*cot(betta) + nrat*cot(gama)))/(sin(betta)*(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3)^2) - (4*pi*cos(gama)*P*r^2*(sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) + nrat*sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2))*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(sin(gama)*(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3)^2);...
       r*((4*pi*P*r^2*(dgama*(cot(gama)^2 + 1) - 2*dbetta*(cot(betta)^2 + 1) + nrat*dgama*(cot(gama)^2 + 1)))/(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3) + (4*pi*r^2*dP*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3) - (4*pi*r^2*dP*(cot(gama) - 2*cot(betta) + nrat*cot(gama)))/(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3) - (4*pi*P*r^2*(2*dgama*(cot(gama)^2 + 1) - dbetta*(cot(betta)^2 + 1) + cos((pi*tan(betta))/tan(gama))*dbetta*(cot(betta)^2 + 1) + sin((pi*tan(betta))/tan(gama))*cot(betta)*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2)))/(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3) + (8*pi*P*r*dr*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3) - (8*pi*P*r*dr*(cot(gama) - 2*cot(betta) + nrat*cot(gama)))/(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3) + (4*pi*P*r^2*(sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) + nrat*sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2))*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3)^2 - (4*pi*P*r^2*(sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2) + nrat*sin((pi*tan(betta))/tan(gama))*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2))*(cot(gama) - 2*cot(betta) + nrat*cot(gama)))/(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3)^2) + ((4*pi*P*r^2*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3) - (4*pi*P*r^2*(cot(gama) - 2*cot(betta) + nrat*cot(gama)))/(cos((pi*tan(betta))/tan(gama)) - nrat + nrat*cos((pi*tan(betta))/tan(gama)) + 3))*dr - c4*dphi;...
       dL/cos(gama) + ((phi - (L0*tan(gama0))/r0)*dr)/sin(gama) + (r*dphi)/sin(gama) + (sin(gama)*L*dgama)/cos(gama)^2 - (cos(gama)*r*(phi - (L0*tan(gama0))/r0)*dgama)/sin(gama)^2;...
       dL/cos(betta) + ((phi - (L0*tan(betta0))/r0)*dr)/sin(betta) + (r*dphi)/sin(betta) + (sin(betta)*L*dbetta)/cos(betta)^2 - (cos(betta)*r*(phi - (L0*tan(betta0))/r0)*dbetta)/sin(betta)^2;...
       (tan(gama)*L*dr)/r^2 - (tan(gama)*dL)/r - (L*(tan(gama)^2 + 1)*dgama)/r - dphi];


    
%% Calculate gradients
f1 = [f12(1), f34(1), f56(1), f78(1)];
f2 = [f12(2), f34(2), f56(2), f78(2)];
f3 = [f12(3), f34(3), f56(3), f78(3)];
f4 = [f12(4), f34(4), f56(4), f78(4)];
f5 = [f12(5), f34(5), f56(5), f78(5)];
f6 = [f12(6), f34(6), f56(6), f78(6)];

for k = 1:4

    df1dx = jacobian(f1(k), x);
    df1dxdot = jacobian(f1(k), xdot);
    
    df2dx = jacobian(f2(k), x);
    df2dxdot = jacobian(f2(k), xdot);
    
    df3dx = jacobian(f3(k), x);
    df3dxdot = jacobian(f3(k), xdot);
    
    df4dx = jacobian(f4(k), x);
    df4dxdot = jacobian(f4(k), xdot);
    
    df5dx = jacobian(f5(k), x);
    df5dxdot = jacobian(f5(k), xdot);
    
    df6dx = jacobian(f6(k), x);
    df6dxdot = jacobian(f6(k), xdot);
    
    % Put these together into dfdx, dfdxdot
    dfdx(:,:,k) = [df1dx; df2dx; df3dx; df4dx; df5dx; df6dx];
    dfdxdot(:,:,k) = [df1dxdot; df2dxdot; df3dxdot; df4dxdot; df5dxdot; df6dxdot];

end