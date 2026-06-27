function [q] = q_selector(r, zeta, n)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
q = zeros(n,1);
for k = 1:n
    r_cal = (1 - r(k,1));
    r_cal = abs(r_cal);
    q(k,1) = r_cal + (zeta-r_cal)*rand;
end
end