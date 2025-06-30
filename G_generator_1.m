% G = (inv(alpha_bar) * (eye(n) - diag(theta)) * W * alpha_bar) +
% inv(alpha) * diag(theta) * B;

function [G, alpha_bar, B, P] = G_generator_1(W, theta, num_f, P)
%G_GENERATOR Generates matrix G and alpha_bar for consensus computation

P = randi([1 4],1);

% Step 1: Initialize random alpha_bar and normalize row-wise
alpha_bar = stochastic(num_f);

while det(alpha_bar) == 0
        alpha_bar = stochastic(num_f);  % Regenerate until invertible
end

alpha_inv = inv(alpha_bar);

const = -((alpha_inv * (eye(num_f) - diag(theta)) * W * alpha_bar));
const_2 = alpha_inv * diag(theta);

for k = 1:num_f
    for j = 1:num_f
        if k ~= P
            const(j,k) = 0;
        end
    end
end

const(P,P) = 0;



B = inv(const_2) * const;

% Step 2: Compute Left-Hand Side of the linear system
LHS = (eye(num_f) - diag(theta)) * W * alpha_bar + diag(theta) * B;

% Step 3: Solve for G
G = linsolve(alpha_bar,LHS);  % Equivalent to inv(alpha_bar) * LHS

% Step 4: Regenerate G if conditions are not met
if ~(max(eig(G)) < 1 && if_neg(G))
    [G, alpha_bar, B] = G_generator_1(W, theta, num_f, P);  % Recursive call
end

end
