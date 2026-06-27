% %{clc;
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
% zeta = max(eig(G));
% c = rand;
% q =  zeta * rand + 0;
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
% [x,x_l] = positions(n);
% 
% % stop time
% T = 500;
% 
% 
% % Iterate the update equation
% % Store all time steps
% x_all = zeros(n, T+1);
% x_all(:,1) = x;
% x_all_bar(:,1) = x_all(:,1) + omega;                   % Masking
% x_l_all = zeros(n, T+1);
% x_l_all(:,1) = x_l;
% x_l_all_bar(:,1) = x_l_all(:,1) + omega;                   % Masking
% 
% 
% % Encoding Procedures
% %xi = zeros(n,1);
% xi_all = zeros(n,T+1);
% x_cap_all = zeros(n,T+1);
% phi_all = zeros(n,T+1);
% p_all = zeros(n,T+1);
% p0 = rand;
% p = zeros(1, T+1);
% p = scale_gen(p0, zeta, p);
% 
% delta_all = zeros(n, T+1);                                           % Quantisation error calculation
% delta_all(:,1) = x_all_bar(:,1) - x_cap_all(:,1);

% Iterate the update equation
for k = 1:T
    % Decoding Procedures
    %phi_all(:,k) = phi_generator(I_q, xi_all(:,k), x_all_bar(:,k), p(k));
    x_cap_all(:,k+1) = decoder(I_q, x_cap_all(:,k), p(k), phi_all(:,k));

    % Masking
    h(:,k+1) = c .* (q .^ (k+1));
    omega(:,k+1) = laplace_noise(0,h(:,k+1)); 

    x = (eye(n) - diag(theta)) * W * x_all(:,k) - (eye(n) - diag(theta)) * W_bar * delta_all(:,k) + (S + (eye(n) - diag(theta)) * W_bar + diag(theta) * B) * omega(:,k) + diag(theta) * B * x_l_all(:,k);
    x_l = G*x_l_all(:,k) + n_cap'; % Now we are trying to update the reference as well
    
    x_all(:,k+1) = x;
    x_all_bar(:,k+1) = x + omega(:,k+1);
    x_l_all(:,k+1) = x_l;
    x_l_all_bar(:,k+1) = x_l + omega(:,k+1);

    delta_all(:,k+1) = x_all_bar(:,k+1) - x_cap_all(:,k+1);

    % Encoding Procedures
    phi_all(:,k+1) = phi_generator(I_q, xi_all(:,k), x_all_bar(:,k+1), p(k+1));
    xi_all(:,k+1) = encoder(I_q, xi_all(:,k), p(k), phi_all(:,k));
end

% Plot the evolution of each follower’s state
figure;
% subplot(211);
% h1 = plot(0:T, abs(x_all'), Color="r");
% hold on;
% h2 = plot(0:T, x_l_all', Color="g");
% 
% title('State Evolution ver-4');
% legend([h1(1), h2(1)], {'Followers', 'Leaders'}); % legend for first line of each
% 
% hold off;
% 
% subplot(212);
h3 = plot(0:T, abs(delta_all));
title('Quantisation ver-4');
legend;