function fakeData = gen_fakeData( tf )
%gen_fakeData: generates a csv with fake test data from a nonlinear system
% with input
%   Can use the csv generated by this function to test the rest of the code


Ts = 0.02;  % sampling period
x0ub = [1, 1];  % upper bound of initial state
x0lb = [-1, -1];    % lower bound of initial state

tspan = [0, tf];

x0 = (x0ub - x0lb)*rand + x0lb; % random initial state

[t, v] = ode45(@(t,x) vf_real(x, gen_fakeInput(t)), tspan, x0);   % simulate plant response input (defined below)
u = gen_fakeInput(t);

tq = (0:Ts:tf)';
vq = interp1(t,v,tq);   % interpolate results to get samples at sampling interval Ts
uq = interp1(t,u,tq);

% inject noise with standard deviation 0.01
mean = 0;   % mean offset
sigma = 0.01;   % standard deviation
noise = sigma .* randn(size(vq)) + mean;
vq = vq + noise;

% store data as a .mat file and a csv (make proper variable names for .mat)
t = tq;
x = vq(:,:);     % only outpu the x1, (x2 will be found via numerical derivatives)
u = uq;

csvwrite('fakeData.csv', [tq, vq, uq]);
save('fakeData.mat', 't', 'x', 'u');

% define output
fakeData = struct;
fakeData.t = tq;
fakeData.x = vq(:,:);   % only outpu the x1, (x2 will be found via numerical derivatives)
fakeData.u = uq;
    
end



% Dynamics of fake system
function vf = vf_real(in1,u1)
%VF_REAL
%    VF = VF_REAL(IN1,U1)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    31-Jul-2018 16:47:28

x1 = in1(1,:);
x2 = in1(2,:);
t2 = x1.^2;
vf = [x2;x1-x2.*(1.0./5.0)+t2.*u1.*(1.0./5.0)-t2.*x1];

end