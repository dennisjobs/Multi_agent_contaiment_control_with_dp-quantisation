


epsilon = zeros(n,1);
for k = 1:n
    epsilon(k,1) = q(k,1) / (c(k,1)*(q(k,1) - abs(1 - r(k,1))));
end

figure;
h4 = plot(epsilon);
title("Differential privacy for each follower")
