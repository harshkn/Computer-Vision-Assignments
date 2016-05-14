function [sample_points1,sample_points2] = pick_samples(keypoints1,keypoints2,k)
%% Randomly picks k points from given keypoints
%
%   INPUTS
%       keypoints1          Mx2 matrix of keypoints from left image
%       keypoints2          Mx2 matrix of keypoints from right image
%       k                   number of points to pick
%
%   OUTPUTS
%       sample_points1      4x2 samples from the first image
%       sample_points2      4x2 samples from the second image
%%

rpoint = rand(1, length(keypoints1));
[srpoint, pointindex] = sort(rpoint);
fourpoints = pointindex(1:k);
sample_points1 = keypoints1(fourpoints(1:4),:);
sample_points2 = keypoints2(fourpoints(1:4),:);

% format check
assert(all(size(sample_points1) == [4 2]));
assert(all(size(sample_points2) == [4 2]));
