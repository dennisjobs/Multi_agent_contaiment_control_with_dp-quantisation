close all;
clear all;
clc;

load('sub_2_workspace.mat');

% P = randi([1,4]);
P = 3;
r = zeros(n,1);
for k = 1 : n
    r(k,1) = r_cap_generator(0,S,theta,W,G,k);
end
zeta = max(eig(G)) + (1 - max(eig(G))) * rand;
p0 = rand;
c = rand(n,1);
q = q_selector(r,zeta,n);

index_dp;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


index_1;

% phi_all_1 = phi_all;
x_all_1 = x_all;
x_l_all_1 = x_l_all;

load('sub_2_workspace.mat');
index_2;

x_all_2 = x_all;
x_l_all_2 = x_l_all;

load('sub_2_workspace.mat');
index_3;

phi_all_3 = phi_all;
x_cap_all_3 = x_cap_all;

load('sub_2_workspace.mat');
index_4;
load('sub_2_workspace.mat');

delt = randi([1, 20]);
x1(P) = x1(P) + delt;
% x_l(P) = x_l(P) + delt;

index_5;

x_all_3 = x_all;
x_l_all_3 = x_l_all;

phi_all_4 = phi_all;
x_cap_all_4 = x_cap_all;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Sample every 5th point from phi_all and phi_all_4
phi4_samples = phi_all_4(:,1:3:end);
phi3_samples = phi_all_3(:,1:3:end);

% Create corresponding x-axis values
x_vals = 0:(length(phi4_samples(1,:))-1);

figure;
h5 = plot(x_vals, phi4_samples(1,:), 'o', 'Color', 'g');
hold on;
h6 = plot(x_vals, phi4_samples(2,:), 'o', 'Color', 'r');
h7 = plot(x_vals, phi4_samples(3,:), 'o', 'Color', 'b');
h8 = plot(x_vals, phi4_samples(4,:), 'o', 'Color', 'k');
h4 = plot(x_vals, phi3_samples(1,:), 'x', 'Color', 'g');
h9 = plot(x_vals, phi3_samples(2,:), 'X', 'Color', 'r');
h10 = plot(x_vals, phi3_samples(3,:), 'X', 'Color', 'b');
h11 = plot(x_vals, phi3_samples(4,:), 'X', 'Color', 'k');
hold off;

legend([h5 h6 h7 h8 h4 h9 h10 h11]);
xlabel('Sample Index (every 5th)');
ylabel('\phi value');
xlim([0 length(x_vals)]);
title('Sampled Plot of phi\_all and phi\_all\_4');

x_cap4_samples = x_cap_all_4(:,1:5:350);

x_cap3_samples = x_cap_all_3(:,1:5:350);
x_l_all_sample = x_l_all(:,1:5:350); 

% Create corresponding x-axis values
x_vals = 0:(length(x_cap4_samples(1,:))-1);
x_l_vals = 0:(length(x_l_all_sample(1,:))-1);

figure;
h12 = plot(x_vals, x_cap4_samples(1,:), 'o', 'Color', 'g');
hold on;
h13 = plot(x_vals, x_cap4_samples(2,:), 'o', 'Color', 'r');
h14 = plot(x_vals, x_cap4_samples(3,:), 'o', 'Color', 'b');
h15 = plot(x_vals, x_cap4_samples(4,:), 'o', 'Color', 'k');
h16 = plot(x_vals, x_cap3_samples(1,:), 'x', 'Color', 'g');
h17 = plot(x_vals, x_cap3_samples(2,:), 'X', 'Color', 'r');
h18 = plot(x_vals, x_cap3_samples(3,:), 'X', 'Color', 'b');
h19 = plot(x_vals, x_cap3_samples(4,:), 'X', 'Color', 'k');
%h2 = plot(x_l_vals, x_l_all_sample, Color="m");

hold off;

legend([h12, h13, h14, h15, h16, h17, h18, h19], {'follower_A1', 'follower_A2', 'follower_A3', 'follower_A4', 'follower_B1', 'follower_B2', 'follower_B3', 'follower_B4'});
xlabel('Sample Index');
ylabel('\phi value');
xlim([0 length(x_vals)]);
title('Sampled Plot of xcap\_all\_4 and xcap\_all\_3');

figure;
h20 = plot(x_vals, x_cap4_samples(3,:), 'o', 'Color', '#000000');
hold on;
h21 = plot(x_vals, x_cap3_samples(3,:), 'x', 'Color', 'r');
% h21 = plot(x_vals, x_cap3_samples(P,:), '+', 'Color', 'b');
h22 = plot(x_l_vals, x_l_all_sample', 'Color', 'g');
% h22 = plot(x_vals, x_l_all', Color="g");
% h13 = plot(x_vals, x_cap4_samples(2,:), 'o', 'Color', 'r');
% h14 = plot(x_vals, x_cap4_samples(3,:), 'o', 'Color', 'b');
% h15 = plot(x_vals, x_cap4_samples(4,:), 'o', 'Color', 'k');
% h16 = plot(x_vals, x_cap3_samples(1,:), 'x', 'Color', 'g');
% h17 = plot(x_vals, x_cap3_samples(2,:), 'X', 'Color', 'r');
% h18 = plot(x_vals, x_cap3_samples(3,:), 'X', 'Color', 'b');
% h19 = plot(x_vals, x_cap3_samples(4,:), 'X', 'Color', 'k');
% %h2 = plot(x_l_vals, x_l_all_sample, Color="m");

hold off;

% legend([h20, h21, h22]);
xlabel('Sample Index');
ylabel('\phi value');
xlim([0 length(x_vals)]);
title('Sampled Plot of xcap\_all\_4 and xcap\_all\_3');


phi_all_D_3 = abs(phi_all_3 - phi_all_4); 

x_vals = 0:(length(phi_all_D_3(1,:))-1);
x_l_vals = 0:(length(x_l_all(1,:))-1);
% figure;
% h23 = plot(x_vals, phi_all_D_3(3,:));


delt