function flag = if_neg(G)
%IF_NEG Returns true if all elements of G are non-negative
%   Input:  G - any matrix
%   Output: flag - logical true (1) if G ≥ 0 element-wise, else false (0)

flag = all(G(:) >= 0);
end