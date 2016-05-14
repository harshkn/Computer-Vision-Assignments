function [num_inliers,indices] = find_inliers(distances,threshold)
%%
% Computes the inliers for the given homography distances and the given
% RANSAC threshold.
%
%   INPUTS
%       distances       homography distances
%       threshold       RANSAC threshold for inliers
%
%   OUTPUTS
%       num_inliers     number of inliers
%       indices         indices of inliers
%%


indices = find(distances < threshold);
num_inliers = numel(indices);


