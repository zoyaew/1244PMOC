function f = add_pepper_noise(img_input, p)
    [M, N] = size(img_input);
    % Get floor(M*N*p) values randomly selected without replacement
    % from integer 1 to M*N
    rand_index = randsample(M*N, floor(M*N*p));
    % Make the randomly selected element to have 0 value
    img_input(rand_index) = 0;
    f = uint8(img_input);
end