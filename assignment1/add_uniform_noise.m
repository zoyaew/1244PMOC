function f = add_uniform_noise(img_input, a, b)
    [M, N] = size(img_input);
    % Create an MxN matrix where each element is a random number from [a,b]
    random_unif = a + (b-a)*rand(M, N);
    % output is img_input + noise from the random_unif
    % when element<0 or element>255, it is automatically converted to be
    % in the range of uint8, i.e. 0 and 255 respectively
    f = uint8(double(img_input) + random_unif);
end