function u = setInput( t, params )
%setInput: Specify the pressure input, u(t), for the system here
%   Detailed explanation goes here

p = params.p;
n = params.n;

u = zeros(sum(n),1);

u(1) = 1;
u(2) = 1;

end

