function [lap_noise] = laplace_noise(mean,b)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

u = rand;
lap_noise = b;

for k = 1:length(b)
    
    lap_noise(k,1) = mean - b(k,1) * sign(u) .* log(1 - 2 * abs(u));
    u = rand;
end
end