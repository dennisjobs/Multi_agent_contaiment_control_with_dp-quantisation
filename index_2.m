% clc;
% clear;
% 
% n = 4;
% [B,W,theta,n_cap] = Rand_generator(n);
% [G,alpha_bar] = G_generator(W,B,theta,n);
% 
% % Degree matrix 
% D = diag(sum(W,2));
% 
% % laplacian matrix of W
% Lap = D - W; 
% 
% W_cap = diag(diag(W));
% 
% W_bar = W - W_cap;
% 
% % Design matrix
% I_q = W - diag(theta)*W_bar;
% 
% % Noise selection parameter
% %omega = laplacian(B);
% c = rand;
% q = rand;
% b = zeros(n,1);
% b = scale_gen(c,q,b);
% omega = laplace_noise(0,b);
% 
% % followers selection factor
% S = diag(rand(1,n));
% 
% % Initial follower states
% %x = zeros(n, 1);  
% %x = [-1; -2; -3; -4; 18; 19; -5; -7; 20; 21];
% % let say reference states be stationary
% %x_l = [1; 2; 3; 4; 12; 13; 14; 15; 16; 17];  
% %x_l = [1; 1; 1; 1; 1; 3; 3; 3; 3; 3];
% [x, x_l] = positions(n);
% 
% % stop time
% T = 300;
% 
% % Store all time steps
% x_all = zeros(n, T+1);
% x_all(:,1) = x;
% x_all_bar(:,1) = x_all(:,1) + omega;                   % Masking
% x_l_all = zeros(n, T+1);
% x_l_all(:,1) = x_l;
% x_l_all_bar(:,1) = x_l_all(:,1) + omega;                   % Masking

 
% Iterate the update equation
for k = 1:T
    % Masking
    h(:,k+1) = c .* (q .^ (k+1));
    omega(:,k+1) = laplace_noise(0,h(:,k+1)); 

    x = (eye(n) - diag(theta)) * W_cap * x_all(:,k) + (eye(n) - diag(theta)) * W_bar * x_all_bar(:,k) + diag(theta) * B * x_l_all_bar(:,k) + S * omega(:,k);
    x_l = G*x_l_all(:,k) + n_cap'; % Now we are trying to update the reference as well
    x_all(:,k+1) = x;
    x_all_bar(:,k+1) = x + omega(:,k+1);
    x_l_all(:,k+1) = x_l;
    x_l_all_bar(:,k+1) = x_l + omega(:,k+1);
end

% Plot the evolution of each follower’s state
figure;
h1 = plot(0:T, (x_all'), Color="r");
hold on;
h2 = plot(0:T, x_l_all', Color="g");

title('State Evolution ver-2');
legend([h1(1), h2(1)], {'Followers', 'Leaders'}); % legend for first line of each

hold off;
