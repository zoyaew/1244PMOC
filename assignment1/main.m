clc
clear

img = imread('XX.png');

%% --------------- Task 1: Spatial Linear Filtering --------------- 
averaging_mask1 = (1/(3*3))*ones(3,3); % 3x3 averaging filter
averaging_mask2 = (1/(11*11))*ones(11,11); % 11x11 averaging filter
sobelX_mask = [-1 -2 -1; 0 0 0; 1 2 1]; % x-gradient with Sobel operator 
sobelY_mask = sobelX_mask'; % y-gradient with Sobel operator

ave_result1 = filter_spa(img, averaging_mask1, 1);
ave_result2 = filter_spa(img, averaging_mask2, 1);
sobelX_result = filter_spa(img, sobelX_mask, 0);
sobelY_result = filter_spa(img, sobelY_mask, 0);

subplot(221), imshow(ave_result1), title('Averaging 3x3')
subplot(222), imshow(ave_result2), title('Averaging 11x11')
subplot(223), imshow(sobelX_result), title('Sobel X')
subplot(224), imshow(sobelY_result), title('sobel Y')

%%  --------------- Task 2: Spatial Non-linear Filtering  --------------- 

% add uniform noise to the original input image
img_uni = add_uniform_noise(img, -15, 15);

% add epper noises to the original input image
img_pep = add_pepper_noise(img, 0.3);

filter_size = 3;

uni_result = min_filter(img_uni, filter_size);

% preprocess before using the min filter to denoise peppers
img_pep = 255 - img_pep;

pep_result = min_filter(img_pep, filter_size);

% postproess after denoising
pep_result = 255 - pep_result;

figure,
subplot(121), imshow(uni_result), title('Min Filter with Uniform Noises')
subplot(122), imshow(pep_result), title('Min Filter with Pepper Noises')

%% ---------- Task 3: Filtering in the Frequency Domain -----------
highpass_imag_1 = highpass_filter(img, 0.95);
highpass_imag_2 = highpass_filter(img, 0.5);

figure,
subplot(121), imshow(highpass_imag_1, []), title('Highpass Filter (0.95)')
subplot(122), imshow(highpass_imag_2, []), title('Highpass Filter (0.5)')