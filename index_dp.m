
% epsilon = zeros(n,1);
% for k = 1:n
%     epsilon(k,1) = q(k,1) / (c(k,1)*(q(k,1) - abs(1 - r(k,1))));
% end
% 
% figure;
% h4 = stem(epsilon);
% title("Differential privacy for each follower")


c_i = sort(0.1 + 2*rand(3,1));
zeta_1 = 0.9985;
r_i = sort(0.1 + zeta_1*rand(3,1));

nn = 100;
epsilon = zeros(3,nn);

figure;
hold on;

for i = 1:3
    q_i = linspace(abs(1 - r_i(i)), zeta_1, nn);
    for k = 1:nn
        epsilon(i,k) = q_i(k) / (c_i(i) * (q_i(k) - abs(1 - r_i(i))));
    end
    plot(q_i, epsilon(i,:), 'LineWidth', 1.5);
end

xlabel('q_i');
ylabel('\epsilon');
title('Differential privacy for each follower');
grid on;
hold off;
x_lim = min(abs(1-r_i));
xlim([x_lim,zeta_1]);

