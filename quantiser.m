function q_v = quantiser(v, r)
    % Quantizer function that s0upports real and complex inputs
    % Applies quantization to both real and imaginary parts
    k = 1000;
    q_v = zeros(length(v),1);
for k = 1:length(v)
    if isreal(v(k,:))
        % If input is real, just apply the quantizer to it
        q_v(k,1) = quantize_scalar(real(v(k,:)), r);
    else
        % If input is complex, apply to both real and imaginary parts
        real_part = quantize_scalar(real(v(k,:)), r);
        imag_part = quantize_scalar(imag(v(k,:)), r);
        q_v(k,1) = complex(real_part, imag_part);
    end
end

