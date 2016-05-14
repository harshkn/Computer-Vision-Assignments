addpath(genpath('../../data'));

% load the frames
im1 = im2double(imread('frame09.png'));
im2 = im2double(imread('frame10.png'));

addpath(genpath('../common'));
addpath(genpath('../../data'));

% smoothing parameters
smooth_sigma = 2; % standard deviation for smoothing
smooth_fsize = 25; % filter size

% coefficients parameters
coeff_sigma = 2;
coeff_fsize = 11;

% parameters for Harris keypoint detection
harris_sigma = 1;
harris_fsize = 15;
harris_threshold = 1e-7;


% Presmooth image using 'presmooth':
ims1 = presmooth(im1, smooth_sigma, smooth_fsize);
ims2 = presmooth(im2, smooth_sigma, smooth_fsize);
% first-order derivatives of smoothed images using 'compute-derivatives':
[dx,dy,dt] = compute_derivatives(ims1,ims2);

% compute coefficients using 'compute_coefficients':
[dx2,dy2,dxdy,dxdt,dydt] = compute_coefficients(dx,dy,dt,coeff_sigma,coeff_fsize);

% Detect interest points using 'detect_interestpoints':

[y,x] = detect_interestpoints(im1,harris_sigma,harris_fsize,harris_threshold);

% Compute optical flow for interest points using 'compute_flow':
[u,v] = compute_flow(x,y,dx2,dy2,dxdy,dxdt,dydt);

% display optical flow on top of the image using 'show_flow':
show_flow(x,y,u,v,im1)
