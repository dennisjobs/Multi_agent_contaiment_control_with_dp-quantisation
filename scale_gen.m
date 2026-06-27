function [b] = scale_gen(c,q,b)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
for k = 1:length(b)
    b(k) = c*(q^k);
end
end