function img_result = filter_spa(img_input, filter, padding)
    [M, N] = size(img_input);
    [m, n] = size(filter);
    m_pad = (m-1)/2;
    n_pad = (n-1)/2;
    
    % img_padded is zero matrix with img_input in the middle of the matrix,
    % i.e. padding == 0
    img_padded = zeros(M+m-1, N+n-1);
    img_padded(1+m_pad:m_pad+M, 1+n_pad:n_pad+N) = img_input;
    
    if padding~=0 % change the zero padding to circular padding
        % create a big 3x3 image matrix where each element is the img_input
        img_big = [img_input, img_input, img_input; img_input, img_input, img_input; img_input, img_input, img_input];
        % crop the img_big to be put into the img_padded
        img_padded = img_big(M+1-m_pad:M+M+m_pad, N+1-n_pad:N+N+n_pad);
    end
    
    img_result = zeros(M,N);
    % do convolution
    for i=1:M
        for j=1:N
            img_result(i,j) = sum(sum(double(filter).*double(img_padded(i:i+m-1, j:j+n-1))));
        end
    end
    % normalize img_result to uint8
    % when element<0 or element>255, it is automatically converted to be
    % in the range of uint8, i.e. 0 and 255 respectively
    img_result = uint8(img_result);
end
