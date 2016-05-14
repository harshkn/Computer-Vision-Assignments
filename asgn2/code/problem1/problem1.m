%% Problem 1 - Image Pyramids and Image Sharpening

%% Parameters
fsize = [5 5]; sigma = 1.5; nlevels = 6;

%% Load image
im = im2double(imread('../../data/a2p1.png'));

%% 1) Create a Gaussian image pyramid with 6 levels using make_gaussianpyramid

G = make_gaussianpyramid(im, nlevels, fsize, sigma);

%% 2) Display the Gaussian pyramid in one figure with display_pyramid
figure(1)
display_pyramid(G);
title('Gaussian Pyramid');
%% 3a) Create a Laplacian image pyramid with 6 levels using make_laplacianpyramid
L = make_laplacianpyramid(G,nlevels, fsize);
%% 3b) Display the Laplacian pyramid in one figure with display_pyramid
figure(2)
display_pyramid(L);
title('Laplacian Pyramid');
figure(3)
display_pyramid(L); % Used just to get a bigger figure window to display task 4c =) 
%% 4a) Amplify finest two sub-bands of the Laplacian pyramid with amplify_high_freq2
L_amp = amplify_high_freq2(L);
%% 4b) Reconstruct the sharpened image with reconstruct_laplacianpyramid
imSharp = reconstruct_laplacianpyramid(L_amp,fsize);
%% 4c) Display original, reconstruction and their difference in a single figure
difIm = mat2gray(imSharp - im);
% newIm = [im imSharp abs(difIm)];
figure(3)
% imshow(newIm);
% title('Original Image  | Reconstructed Image  |  Difference of previous images');

subplot(1,3,1); imshow(im); title('Original Image');
subplot(1,3,2); imshow(imSharp); title('Reconstructed Image');
subplot(1,3,3); imshow((difIm)); title('Difference of previous images');

