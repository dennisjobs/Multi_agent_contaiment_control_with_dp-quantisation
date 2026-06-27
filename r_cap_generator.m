function [r_cap] = r_cap_generator(flag, S, theta, W, G, P)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
if flag == 0 
    r_cap = 1 +  S(P,P) - (1 - theta(P)) * W(P,P);
end

if flag == 1 
    r_cap = 1 - G(P,P);
end

end