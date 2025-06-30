close all;
clc;

index_dp;

load('sub_2_workspace.mat');
index_1;
load('sub_2_workspace.mat');
index_2;
load('sub_2_workspace.mat');
index_3;

phi_all_3 = phi_all;
x_cap_all_3 = x_cap_all;

load('sub_2_workspace.mat');
index_4;
load('sub_2_workspace.mat');

index_5;

phi_all_4 = phi_all;
x_cap_all_4 = x_cap_all;

% %[G,alpha_bar,B] = G_generator_1(W,theta,n,P);


% Sample every 5th point from phi_all and phi_all_4
phi4_samples = phi_all_4(1:5:end);
phi3_samples = phi_all_3(1:5:end);

% Create corresponding x-axis values
x_vals = 0:(length(phi4_samples)-1);

figure;
h5 = plot(x_vals, phi4_samples, 'o', 'Color', 'r');
hold on;
h4 = plot(x_vals, phi3_samples, 'x', 'Color', 'g');
hold off;

legend({'phi\_all_4', 'phi\_all_3'});
xlabel('Sample Index (every 5th)');
ylabel('\phi value');
title('Sampled Plot of phi\_all and phi\_all\_4');

x_cap4_samples = x_cap_all_4(1:5:end);
x_cap3_samples = x_cap_all_3(1:5:end);

% Create corresponding x-axis values
x_vals = 0:(length(x_cap4_samples)-1);

figure;
h5 = plot(x_vals, x_cap4_samples, 'o', 'Color', 'g');
hold on;
h4 = plot(x_vals, x_cap3_samples, '+', 'Color', 'r');
hold off;

legend({'x_cap\_all_4', 'xcap\_all_3'});
xlabel('Sample Index (every 5th)');
ylabel('\phi value');
title('Sampled Plot of xcap\_all\_4 and xcap\_all\_3');