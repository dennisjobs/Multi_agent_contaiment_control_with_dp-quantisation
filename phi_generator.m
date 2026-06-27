function [phi] = phi_generator(I_Q, xi_, x_bar, p)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
phi = (x_bar - I_Q * xi_) / p;
phi = quantiser(phi, 1);
end