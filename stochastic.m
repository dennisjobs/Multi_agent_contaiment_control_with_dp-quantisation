function [a] = stochastic(num_f)
a = rand(num_f, num_f);

for k = 1:num_f
    row_sum = sum(a(k,:));   % row-wise sum
    a(k,:) = a(k,:) / row_sum;  % Normalize with W weights
end

end