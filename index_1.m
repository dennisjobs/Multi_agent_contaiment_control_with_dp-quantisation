% clc;
% clear;
% 
% n = 4;
% [B,W,theta,n_cap] = Rand_generator(n);
% [G,alpha_bar] = G_generator(W,B,theta,n);
% 
% 
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
% %omega = laplacian
% 
% % Initial follower states
% %x = zeros(n, 1);  
% %x = [-1; -2; -3; -4; 18; 19; -5; -7; 20; 21];
% % let say reference states be stationary
% %x_l = [1; 2; 3; 4; 12; 13; 14; 15; 16; 17];  
% %x_l = [1; 1; 1; 1; 1; 3; 3; 3; 3; 3];
% [x,x_l] = positions(n);
% 
% 
% % stop time
% T = 300;
% 
% 
% % Store all time steps
% x_all = zeros(n, T+1);
% x_all(:,1) = x;
% x_l_all = zeros(n, T+1);
% x_l_all(:,1) = x_l;
% % Iterate the update equation
for k = 1:T
    x = (eye(n) - diag(theta)) * W * x_all(:,k) + diag(theta) * B * x_l_all(:,k);
    x_l = G*x_l_all(:,k) + n_cap'; % Now we are trying to update the reference as well
    x_all(:,k+1) = x;
    x_l_all(:,k+1) = x_l;
end

% Plot the evolution of each follower’s state
figure;
h1 = plot(0:T, (x_all'), Color="r");
hold on;
h2 = plot(0:T, x_l_all', Color="g");

title('State Evolution ver-1');
legend([h1(1), h2(1)], {'Followers', 'Leaders'}); % legend for first line of each

hold off;