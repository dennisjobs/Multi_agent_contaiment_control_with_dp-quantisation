function q_v = quantize_scalar(v, r)
    % Quantizer function q(v) with interval r
    % Implements the piecewise function described
    
    if abs(v) < 0.5 * r
        q_v = 0;
    elseif v >= 0.5 * r
        m = floor((v + 0.5 * r) / r);
        q_v = m * r;
    else
        q_v = -quantize_scalar(-v, r);
    end
end