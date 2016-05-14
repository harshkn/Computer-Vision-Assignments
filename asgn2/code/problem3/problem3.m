%% Problem 3 - Harris Detector

%% Parameters
sigma_0 = 2.4; harris_th = 1e-6; fsize = 25;

%% 1) Load the image with load_image
[im,imrgb] = load_image('../../data/a2p3.png');

%% 2) Calculate the structure tensor with compute_tensor
[dx2,dy2,dxdy] = compute_tensor(im,sigma_0,fsize);
%% 3a) Compute Harris function values with compute_harris
harris = compute_harris(dx2,dy2,dxdy,sigma_0);
%% 3b) Display the Harris image (Note: read doc for imshow and imagesc)


figure(1)
imagesc(harris); colormap(jet);
title('Red: High ; Blue: Low');
%% 4a) Obtain the x and y coordinates of remaining points after non maximum suppression
%%     and thresholding.
[px,py] = nonmaxsupp(harris,harris_th);

%% 4b) Display the points on top of the rgb image
figure(2)
%imshow(uint8(imrgb));
imshow(imread('../../data/a2p3.png'));
hold on;
plot(py,px,'xb');
