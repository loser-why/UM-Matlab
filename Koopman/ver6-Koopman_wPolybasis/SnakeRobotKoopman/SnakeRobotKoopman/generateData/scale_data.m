function [ x_scaled, u_scaled ] = scale_data( x , u )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

scale = 1;
n = size(x,2);
p = size(u,2);

% maximum value for each of the states (doesn't include input), in a row vector
maxStates = max( abs( max(x, [],1) ) , abs( min(x, [],1) ));

% scale each state so that it never goes outside the range [-scale, scale]
x_scaled = scale * x ./ maxStates;
% x_scaled = x;

% scale the input so that it never goes above scale
u_scaled = scale * u ./ 10;

end

