function [B,W,theta,n_cap] = Rand_generator(num_f)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

theta = rand(1,num_f); % Follows uniform disturbution
n_cap = rand(1,num_f); % Follows uniform disturbution

W = rand(num_f, num_f);
for k = 1:num_f
    row_sum = sum(W(k,:));   % row-wise sum
    W(k,:) = W(k,:) / row_sum;  % Normalize with W weights
end

B = rand(num_f)*0.10 + 0.20;
end