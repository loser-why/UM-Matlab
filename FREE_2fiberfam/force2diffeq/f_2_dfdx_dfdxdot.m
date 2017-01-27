%% Calculate dfdx, dfdxdot from f (only the second & third row of f)

clear

syms r0 L0 gama0 betta0 P gama betta r L dP dgama dbetta dr dL c1 c2 c3 c4 c5 c6 x u phi dphi

x = [P gama betta r L phi];
xdot = [dP dgama dbetta dr dL dphi];

%% 2 families of fibers (1/24/2017)
% f = [-dP + 0.5*(u - P);...  % The constant in front of (u-P) is arbitrary 
%      pi*r^2*dP - c1*dL + 2*pi*P*r*dr - pi*r^2*(cot(betta)^2 + cot(gama)^2)*dP + pi*P*r^2*(2*cot(betta)*dbetta*(cot(betta)^2 + 1) + 2*cot(gama)*dgama*(cot(gama)^2 + 1)) - 2*pi*P*r*(cot(betta)^2 + cot(gama)^2)*dr;...
%      c4*((tan(gama)*dL)/r + (L*(tan(gama)^2 + 1)*dgama)/r - (tan(gama)*L*dr)/r^2) - pi*P*r^3*((cot(betta)^2 + 1)*dbetta + (cot(gama)^2 + 1)*dgama) + pi*r^3*dP*(cot(betta) + cot(gama)) + 3*pi*P*r^2*dr*(cot(betta) + cot(gama));...
%      sin(gama)*dgama + (cos(gama0)*dL)/L0;...
%      sin(betta)*dbetta + (cos(betta0)*dL)/L0];

%% Case 1: gama,betta>0, gam>betta, 2*l_gama<l_betta
% f = [-dP + 0.5*(u - P);...  % The constant in front of (u-P) is arbitrary 
%      ((2*pi*cot(gama)*P*r^2 + 2*pi*cos((pi*tan(betta))/tan(gama))*cot(betta)*P*r^2)*dgama)/(cos((pi*tan(betta))/tan(gama)) + 1) - c1*dL + pi*r^2*dP - (cos(betta)*(2*pi*cot(betta)*r^2*dP - 2*pi*cot(gama)*r^2*dP + 4*pi*cot(betta)*P*r*dr - 4*pi*cot(gama)*P*r*dr - 2*pi*P*r^2*dbetta*(cot(betta)^2 + 1) + 2*pi*P*r^2*dgama*(cot(gama)^2 + 1)))/(sin(betta) + cos((pi*tan(betta))/tan(gama))*sin(betta)) + 2*pi*P*r*dr + (cos(betta)*(2*pi*cot(betta)*P*r^2 - 2*pi*cot(gama)*P*r^2)*(cos(betta)*dbetta + cos((pi*tan(betta))/tan(gama))*cos(betta)*dbetta - sin((pi*tan(betta))/tan(gama))*sin(betta)*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2)))/(sin(betta) + cos((pi*tan(betta))/tan(gama))*sin(betta))^2 + (sin(betta)*(2*pi*cot(betta)*P*r^2 - 2*pi*cot(gama)*P*r^2)*dbetta)/(sin(betta) + cos((pi*tan(betta))/tan(gama))*sin(betta)) - (cos(gama)*(2*pi*cot(gama)*r^2*dP + 4*pi*cot(gama)*P*r*dr - 2*pi*P*r^2*dgama*(cot(gama)^2 + 1) + 2*pi*cos((pi*tan(betta))/tan(gama))*cot(betta)*r^2*dP + 4*pi*cos((pi*tan(betta))/tan(gama))*cot(betta)*P*r*dr - 2*pi*cos((pi*tan(betta))/tan(gama))*P*r^2*dbetta*(cot(betta)^2 + 1) - 2*pi*sin((pi*tan(betta))/tan(gama))*cot(betta)*P*r^2*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2)))/(sin(gama)*(cos((pi*tan(betta))/tan(gama)) + 1)) + (cos(gama)^2*(2*pi*cot(gama)*P*r^2 + 2*pi*cos((pi*tan(betta))/tan(gama))*cot(betta)*P*r^2)*dgama)/(sin(gama)^2*(cos((pi*tan(betta))/tan(gama)) + 1)) - (sin((pi*tan(betta))/tan(gama))*cos(gama)*(2*pi*cot(gama)*P*r^2 + 2*pi*cos((pi*tan(betta))/tan(gama))*cot(betta)*P*r^2)*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2))/(sin(gama)*(cos((pi*tan(betta))/tan(gama)) + 1)^2);...
%      c4*((tan(gama)*dL)/r + (L*(tan(gama)^2 + 1)*dgama)/r - (tan(gama)*L*dr)/r^2) + (2*pi*cot(gama)*r^2*dP + 4*pi*cot(gama)*P*r*dr - 2*pi*P*r^2*dgama*(cot(gama)^2 + 1) + 2*pi*cos((pi*tan(betta))/tan(gama))*cot(betta)*r^2*dP + 4*pi*cos((pi*tan(betta))/tan(gama))*cot(betta)*P*r*dr - 2*pi*cos((pi*tan(betta))/tan(gama))*P*r^2*dbetta*(cot(betta)^2 + 1) - 2*pi*sin((pi*tan(betta))/tan(gama))*cot(betta)*P*r^2*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2))/(cos((pi*tan(betta))/tan(gama)) + 1) + (sin(betta)*(2*pi*cot(betta)*r^2*dP - 2*pi*cot(gama)*r^2*dP + 4*pi*cot(betta)*P*r*dr - 4*pi*cot(gama)*P*r*dr - 2*pi*P*r^2*dbetta*(cot(betta)^2 + 1) + 2*pi*P*r^2*dgama*(cot(gama)^2 + 1)))/(sin(betta) + cos((pi*tan(betta))/tan(gama))*sin(betta)) + (cos(betta)*(2*pi*cot(betta)*P*r^2 - 2*pi*cot(gama)*P*r^2)*dbetta)/(sin(betta) + cos((pi*tan(betta))/tan(gama))*sin(betta)) - (sin(betta)*(2*pi*cot(betta)*P*r^2 - 2*pi*cot(gama)*P*r^2)*(cos(betta)*dbetta + cos((pi*tan(betta))/tan(gama))*cos(betta)*dbetta - sin((pi*tan(betta))/tan(gama))*sin(betta)*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2)))/(sin(betta) + cos((pi*tan(betta))/tan(gama))*sin(betta))^2 + (sin((pi*tan(betta))/tan(gama))*(2*pi*cot(gama)*P*r^2 + 2*pi*cos((pi*tan(betta))/tan(gama))*cot(betta)*P*r^2)*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2))/(cos((pi*tan(betta))/tan(gama)) + 1)^2;...
%      sin(gama)*dgama + (cos(gama0)*dL)/L0;...
%      sin(betta)*dbetta + (cos(betta0)*dL)/L0];

 %% Case 1: gama,betta>0, gam>betta, 2*l_gama<l_betta (UPDATED: added phi state and geometric constraint for phi)
f = [-dP + 0.5*(u - P);...  % The constant in front of (u-P) is arbitrary 
    ((2*pi*cot(gama)*P*r^2 + 2*pi*cos((pi*tan(betta))/tan(gama))*cot(betta)*P*r^2)*dgama)/(cos((pi*tan(betta))/tan(gama)) + 1) - c1*dL + pi*r^2*dP - (cos(betta)*(2*pi*cot(betta)*r^2*dP - 2*pi*cot(gama)*r^2*dP + 4*pi*cot(betta)*P*r*dr - 4*pi*cot(gama)*P*r*dr - 2*pi*P*r^2*dbetta*(cot(betta)^2 + 1) + 2*pi*P*r^2*dgama*(cot(gama)^2 + 1)))/(sin(betta) + cos((pi*tan(betta))/tan(gama))*sin(betta)) + 2*pi*P*r*dr + (cos(betta)*(2*pi*cot(betta)*P*r^2 - 2*pi*cot(gama)*P*r^2)*(cos(betta)*dbetta + cos((pi*tan(betta))/tan(gama))*cos(betta)*dbetta - sin((pi*tan(betta))/tan(gama))*sin(betta)*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2)))/(sin(betta) + cos((pi*tan(betta))/tan(gama))*sin(betta))^2 + (sin(betta)*(2*pi*cot(betta)*P*r^2 - 2*pi*cot(gama)*P*r^2)*dbetta)/(sin(betta) + cos((pi*tan(betta))/tan(gama))*sin(betta)) - (cos(gama)*(2*pi*cot(gama)*r^2*dP + 4*pi*cot(gama)*P*r*dr - 2*pi*P*r^2*dgama*(cot(gama)^2 + 1) + 2*pi*cos((pi*tan(betta))/tan(gama))*cot(betta)*r^2*dP + 4*pi*cos((pi*tan(betta))/tan(gama))*cot(betta)*P*r*dr - 2*pi*cos((pi*tan(betta))/tan(gama))*P*r^2*dbetta*(cot(betta)^2 + 1) - 2*pi*sin((pi*tan(betta))/tan(gama))*cot(betta)*P*r^2*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2)))/(sin(gama)*(cos((pi*tan(betta))/tan(gama)) + 1)) + (cos(gama)^2*(2*pi*cot(gama)*P*r^2 + 2*pi*cos((pi*tan(betta))/tan(gama))*cot(betta)*P*r^2)*dgama)/(sin(gama)^2*(cos((pi*tan(betta))/tan(gama)) + 1)) - (sin((pi*tan(betta))/tan(gama))*cos(gama)*(2*pi*cot(gama)*P*r^2 + 2*pi*cos((pi*tan(betta))/tan(gama))*cot(betta)*P*r^2)*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2))/(sin(gama)*(cos((pi*tan(betta))/tan(gama)) + 1)^2);...
    c4*dphi + (2*pi*cot(gama)*r^2*dP + 4*pi*cot(gama)*P*r*dr - 2*pi*P*r^2*dgama*(cot(gama)^2 + 1) + 2*pi*cos((pi*tan(betta))/tan(gama))*cot(betta)*r^2*dP + 4*pi*cos((pi*tan(betta))/tan(gama))*cot(betta)*P*r*dr - 2*pi*cos((pi*tan(betta))/tan(gama))*P*r^2*dbetta*(cot(betta)^2 + 1) - 2*pi*sin((pi*tan(betta))/tan(gama))*cot(betta)*P*r^2*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2))/(cos((pi*tan(betta))/tan(gama)) + 1) + (sin(betta)*(2*pi*cot(betta)*r^2*dP - 2*pi*cot(gama)*r^2*dP + 4*pi*cot(betta)*P*r*dr - 4*pi*cot(gama)*P*r*dr - 2*pi*P*r^2*dbetta*(cot(betta)^2 + 1) + 2*pi*P*r^2*dgama*(cot(gama)^2 + 1)))/(sin(betta) + cos((pi*tan(betta))/tan(gama))*sin(betta)) + (cos(betta)*(2*pi*cot(betta)*P*r^2 - 2*pi*cot(gama)*P*r^2)*dbetta)/(sin(betta) + cos((pi*tan(betta))/tan(gama))*sin(betta)) - (sin(betta)*(2*pi*cot(betta)*P*r^2 - 2*pi*cot(gama)*P*r^2)*(cos(betta)*dbetta + cos((pi*tan(betta))/tan(gama))*cos(betta)*dbetta - sin((pi*tan(betta))/tan(gama))*sin(betta)*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2)))/(sin(betta) + cos((pi*tan(betta))/tan(gama))*sin(betta))^2 + (sin((pi*tan(betta))/tan(gama))*(2*pi*cot(gama)*P*r^2 + 2*pi*cos((pi*tan(betta))/tan(gama))*cot(betta)*P*r^2)*((pi*(tan(betta)^2 + 1)*dbetta)/tan(gama) - (pi*tan(betta)*(tan(gama)^2 + 1)*dgama)/tan(gama)^2))/(cos((pi*tan(betta))/tan(gama)) + 1)^2;...
    dL/cos(gama) - ((phi + (L0*tan(gama0))/r0)*dr)/sin(gama) - (r*dphi)/sin(gama) + (sin(gama)*L*dgama)/cos(gama)^2 + (cos(gama)*r*(phi + (L0*tan(gama0))/r0)*dgama)/sin(gama)^2;...
    dL/cos(betta) - ((phi + (L0*tan(betta0))/r0)*dr)/sin(betta) - (r*dphi)/sin(betta) + (sin(betta)*L*dbetta)/cos(betta)^2 + (cos(betta)*r*(phi + (L0*tan(betta0))/r0)*dbetta)/sin(betta)^2;...
    (tan(gama)*dL)/r - dphi + (L*(tan(gama)^2 + 1)*dgama)/r - (tan(gama)*L*dr)/r^2];

%% Calculate gradients
f1 = f(1);
f2 = f(2);
f3 = f(3);
f4 = f(4);
f5 = f(5);
f6 = f(6);

df1dx = jacobian(f1, x);
df1dxdot = jacobian(f1, xdot);

df2dx = jacobian(f2, x);
df2dxdot = jacobian(f2, xdot);

df3dx = jacobian(f3, x);
df3dxdot = jacobian(f3, xdot);

df4dx = jacobian(f4, x);
df4dxdot = jacobian(f4, xdot);

df5dx = jacobian(f5, x);
df5dxdot = jacobian(f5, xdot);

df6dx = jacobian(f6, x);
df6dxdot = jacobian(f6, xdot);

% Put these together into dfdx, dfdxdot
dfdx = [df1dx; df2dx; df3dx; df4dx; df5dx; df6dx];
dfdxdot = [df1dxdot; df2dxdot; df3dxdot; df4dxdot; df5dxdot; df6dxdot];