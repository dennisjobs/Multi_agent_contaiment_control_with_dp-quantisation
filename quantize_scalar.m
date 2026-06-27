% function q_v = quantize_scalar(v, r)
%     % Quantizer function q(v) with interval r
%     % Implements the piecewise function described
% 
%     if abs(v) < 0.5 * r
%         q_v = 0;
%     elseif v >= 0.5 * r
%         m = floor((v + 0.5 * r) / r);
%         q_v = m * r;
%     else
%         q_v = -quantize_scalar(-v, r);
%     end
% end

function q_v = quantize_scalar(v, r)

    B = 8;
    L = 2^B;              % 256 levels
    K = (L-1)/2;          % 127 for symmetric range

    vmax = (K + 0.5) * r;
    v_sat = min(max(v, -vmax), vmax);

    m = floor((v_sat + 0.5*r)/r);
    m = min(max(m, -K), K);
    q_v = m * r;

end