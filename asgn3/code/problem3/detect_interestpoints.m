function [x,y] = detect_interestpoints(im,sigma,fsize,threshold)
%% Detects harris keypoints
%
%   INPUTS
%     im           image
%     sigma        standard deviation for Harris detector
%     fsize        filter size for Harris detector
%     threshold    threshold for Harris detector
%
%   OUTPUTS
%     x            vector of x components for detected keypoints
%     y            vector of y components for detected keypoints
[mask, harris1] = harris(im, sigma, fsize, threshold);

[x,y] = find(mask == 1);
