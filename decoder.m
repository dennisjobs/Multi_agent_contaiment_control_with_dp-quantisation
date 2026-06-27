function [xi] = decoder(I_Q, xi_, p, phi_);
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
xi = I_Q * xi_ + p * phi_;
end