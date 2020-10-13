function img_result = highpass_filter(img_input,D0)
    [M, N] = size(img_input);
    img_ft = fftshift(fft2(double(img_input)));
    
    % U and V are matrices representing the
    % U and V coordinate of the img_ft respectively
    U = zeros(M, N);
    V = zeros(M, N);
    for i=1:M
        U(i, :) = ceil(-1*M/2)-1+i;
    end
    for j=1:N
        V(:, j) = ceil(-1*N/2)-1+j;
    end
    
    D = sqrt(U.^2 + V.^2);
    
    % revert D0 [0,1] -> [0, max(D)]
    D0 = D0*max(D(:));
    img_result = ifft2(ifftshift((D>D0).*img_ft));
    
    % normalize img_result to uint8
    img_result = (img_result - min(img_result(:)));
    img_result = img_result ./ max(img_result(:)) * 255;
    img_result = uint8(img_result);
    
end