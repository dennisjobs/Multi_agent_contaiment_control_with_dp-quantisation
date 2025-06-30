function [x,x_l] = positions(num)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
r = randi([-10 10],1,2*num);
a = 1;
b = 1;
x = zeros(num,1);
x_l = zeros(num,1);

r = sort(r);

for k=1 : 2*num
    if k <= num/2 || k > 3*num/2
        x(a,1) = r(1,k);
        a = a + 1;
    end
    
    if k > num/2 && k <= 3*num/2
        x_l(b,1) = r(1,k);
        b = b + 1;
    end

end

end