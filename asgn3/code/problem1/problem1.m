
% Makes given functions and data available through Matlab path
addpath(genpath('../common'));
addpath(genpath('../../data'));

% mask parameter
boundary = 10;           % width of boundary

% Keypoint detection parameters
harris_threshold = 1e-7; % Harris threshold for keypoint detection
sigma = 1.4;             % standard deviation
fsize = 15;              % filter size

% RANSAC Parameters
ransac_threshold = 50;  % inlier threshold
p = 0.5;                % probability that any given correspondence is valid
k = 4;                  % number of samples drawn per iteration
z = 0.99;               % total probability of success after all iterations

%===================================================================

% Load the images
im1 = im2double(imread('a3p1a.png'));
im2 = im2double(imread('a3p1b.png'));

% Make masks for left/right half of images using 'make_masks':
% INSERT CODE HERE

[h,w] = size(im1);
[masklim, maskrim] = make_masks(h,w,boundary);

% Keypoint detection using 'detect_keypoints':
% INSERT CODE HERE
keypoints_l = detect_keypoints(im1,masklim,sigma,fsize,harris_threshold);
keypoints_r = detect_keypoints(im2,maskrim,sigma,fsize,harris_threshold);


%===================================================================

% Extract SIFT features for keypoints using 'sift':
% INSERT CODE HERE
siftd_l = sift(keypoints_l,im1,sigma);
siftd_r = sift(keypoints_r,im2,sigma);

% Compute (squared) Euclidean distance matrix using 'euclidean_square_dist':
% 2 BONUS POINTS: compute distance matrix with 'chi_square_dist' instead
% INSERT CODE HERE
D = chi_square_dist(siftd_l,siftd_r);

% Find putative matching pairs using 'find_matches':
% INSERT CODE HERE
pairs = find_matches(keypoints_l, keypoints_r, D);
% Display putative matching pairs using 'show_matches':
% INSERT CODE HERE

%%
figure(1)
show_matches(im1, im2, pairs);
%%
%===================================================================

% Estimate number of iterations using 'compute_ransac_iterations':
% INSERT CODE HERE
n = compute_ransac_iterations(p,k,z);

%%
% apply RANSAC algorithm using 'ransac':
% INSERT CODE HERE

[best_inliers,best_pairs,best_H] = ransac(pairs,ransac_threshold,n);
%%
% Show 4 best matching pairs using 'show_matches':
% INSERT CODE HERE
figure(2)
show_matches(im1, im2, best_pairs);

% Show all inlier matches for these pairs using 'show_matches'
% INSERT CODE HERE
% show_matches(im1, im2, pairs(best_inliers,:));

%===================================================================
% Htemp = H;
% Image stitching: You can use the given homography for doing the stitch

load('H.mat'); % overwrites variable 'H'
H
best_H
% apply image stitching using 'show_stich'
% INSERT CODE HERE
figure(3);
show_stitch(im1,im2,best_H);

% disp(H)
% disp(Htemp)
