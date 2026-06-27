% tester;
close all;
figure;

x_all_v3 = x_all_1';
subplot(2,2,1);
h1 = plot(0:T, (x_all_v3(:,1)), Color="r");
hold on;
h2 = plot(0:T, x_l_all_1', Color="g");
xlim([0 500]);
title('Without Noise user 1');
% legend([h1(1), h2(1)], {'Followers', 'Leaders'}); % legend for first line of each


x_all_v3 = x_all_2';
subplot(2,2,2);
h1 = plot(0:T, (x_all_v3(:,1)), Color="r");
hold on;
h2 = plot(0:T, x_l_all_2', Color="g");
xlim([0 500]);
title('With Noise');
% legend([h1(1), h2(1)], {'Followers', 'Leaders'}); % legend for first line of each
hold off;

x_all_v3 = x_all_3';
subplot(2,2,3);
h1 = plot(0:T, (x_all_v3(:,1)), Color="r");
hold on;
h2 = plot(0:T, x_l_all_3', Color="g");
xlim([0 500]);
title('With Noise and Quantisation');
% legend([h1(1), h2(1)], {'Followers', 'Leaders'}); % legend for first line of each
hold off;

x_vals = 0:(length(x_cap4_samples(1,:))-1);
x_l_vals = 0:(length(x_l_all_sample(1,:))-1);



x_all_v3 = x_all_3';
subplot(2,2,4);
hold on;
h2 = plot(x_l_vals, x_l_all_sample', Color="m");
h12 = plot(x_vals, x_cap4_samples(1,:), 'o', 'Color', 'g');
h16 = plot(x_vals, x_cap3_samples(1,:), 'x', 'Color', 'g');
title('Observed sequence');
hold off;
xlim([0,65]);
box on;

%%

figure;

x_all_v3 = x_all_1';
subplot(2,2,1);
h1 = plot(0:T, (x_all_v3(:,2)), Color="r");
hold on;
h2 = plot(0:T, x_l_all_1', Color="g");
xlim([0 500]);
title('Without Noise user 2');
% legend([h1(1), h2(1)], {'Followers', 'Leaders'}); % legend for first line of each


x_all_v3 = x_all_2';
subplot(2,2,2);
h1 = plot(0:T, (x_all_v3(:,2)), Color="r");
hold on;
h2 = plot(0:T, x_l_all_2', Color="g");
xlim([0 500]);
title('With Noise');
% legend([h1(1), h2(1)], {'Followers', 'Leaders'}); % legend for first line of each
hold off;

x_all_v3 = x_all_3';
subplot(2,2,3);
h1 = plot(0:T, (x_all_v3(:,2)), Color="r");
hold on;
h2 = plot(0:T, x_l_all_3', Color="g");
xlim([0 500]);
title('With Noise and Quantisation');
% legend([h1(1), h2(1)], {'Followers', 'Leaders'}); % legend for first line of each
hold off;

x_vals = 0:(length(x_cap4_samples(2,:))-1);
x_l_vals = 0:(length(x_l_all_sample(2,:))-1);


x_all_v3 = x_all_3';
subplot(2,2,4);
hold on;
h2 = plot(x_l_vals, x_l_all_sample', Color="m");
h12 = plot(x_vals, x_cap4_samples(2,:), 'o', 'Color', 'g');
h16 = plot(x_vals, x_cap3_samples(2,:), 'x', 'Color', 'g');
title('Observed Sequence');
xlim([0,65]);
box on;

%%

figure;

x_all_v3 = x_all_1';
subplot(2,2,1);
h1 = plot(0:T, (x_all_v3(:,3)), Color="r");
hold on;
h2 = plot(0:T, x_l_all_1', Color="g");
xlim([0 500]);
title('Without Noise User 3');
% legend([h1(1), h2(1)], {'Followers', 'Leaders'}); % legend for first line of each


x_all_v3 = x_all_2';
subplot(2,2,2);
h1 = plot(0:T, (x_all_v3(:,3)), Color="r");
hold on;
h2 = plot(0:T, x_l_all_2', Color="g");
xlim([0 500]);
title('With Noise');
% Rlegend([h1(1), h2(1)], {'Followers', 'Leaders'}); % legend for first line of each
hold off;

x_all_v3 = x_all_3';
subplot(2,2,3);
h1 = plot(0:T, (x_all_v3(:,3)), Color="r");
hold on;
h2 = plot(0:T, x_l_all_3', Color="g");
xlim([0 500]);
title('With Noise and Quantisation');
% legend([h1(1), h2(1)], {'Followers', 'Leaders'}); % legend for first line of each
hold off;

x_vals = 0:(length(x_cap4_samples(1,:))-1);
x_l_vals = 0:(length(x_l_all_sample(1,:))-1);



x_all_v3 = x_all_3';
subplot(2,2,4);
hold on;
h2 = plot(x_l_vals, x_l_all_sample', Color="m");
h12 = plot(x_vals, x_cap4_samples(3,:), 'o', 'Color', 'g');
h16 = plot(x_vals, x_cap3_samples(3,:), 'x', 'Color', 'g');
title('Observed Sequence');
xlim([0,65]);
box on;

%%

figure;

x_all_v3 = x_all_1';
subplot(2,2,1);
h1 = plot(0:T, (x_all_v3(:,4)), Color="r");
hold on;
h2 = plot(0:T, x_l_all_1', Color="g");
xlim([0 500]);
title('Without Noise user 4');
% legend([h1(1), h2(1)], {'Followers', 'Leaders'}); % legend for first line of each


x_all_v3 = x_all_2';
subplot(2,2,2);
h1 = plot(0:T, (x_all_v3(:,4)), Color="r");
hold on;
h2 = plot(0:T, x_l_all_2', Color="g");
xlim([0 500]);
title('With Noise ');
% legend([h1(1), h2(1)], {'Followers', 'Leaders'}); % legend for first line of each
hold off;

x_all_v3 = x_all_3';
subplot(2,2,3);
h1 = plot(0:T, (x_all_v3(:,4)), Color="r");
hold on;
h2 = plot(0:T, x_l_all_3', Color="g");
xlim([0 500]);
title('With Noise and Quantisation');
% legend([h1(1), h2(1)], {'Followers', 'Leaders'}); % legend for first line of each
hold off;

x_vals = 0:(length(x_cap4_samples(1,:))-1);
x_l_vals = 0:(length(x_l_all_sample(1,:))-1);



x_all_v3 = x_all_3';
subplot(2,2,4);
hold on;
h2 = plot(x_l_vals, x_l_all_sample', Color="m");
h12 = plot(x_vals, x_cap4_samples(4,:), 'o', 'Color', 'g');
h16 = plot(x_vals, x_cap3_samples(4,:), 'x', 'Color', 'g');
title('Observed Sequence');
xlim([0,65]);
box on;