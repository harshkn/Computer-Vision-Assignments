function [best_inliers,best_pairs,best_H] = ransac(pairs,threshold,niterations)
%%
% RANSAC algorithm.
%
% INPUTS:
%   pairs           Mx4 coordinates of matching correspondences,
%                   where M is the number of overall one-to-one mappings.
%   threshold       RANSAC inlier threshold
%   niterations     number of iterations to run
%
% OUTPUTS:
%   best_inliers    vector with the indices of all inliers for the homography
%                   that has been estimated using the 4 best matching pairs,
%                   where N is the number of inliers.
%   best_pairs      4x4 best matching pairs with format [x1 y1 x1 x2]
%   best_h          best homography estimated
%%
k = 4;
best_inliers = 0;
for iter = 1:niterations
    newp1 = [pairs(:,1:2) ones(size(pairs,1),1)];
    newp2 = [pairs(:,3:4) ones(size(pairs,1),1)];
    [sample_points1,sample_points2] = pick_samples(pairs(:,1:2), pairs(:,3:4),k);
    sample_pointsz1 = [sample_points1 ones(size(sample_points1,1),1)]';
    sample_pointsz2 = [sample_points2 ones(size(sample_points2,1),1)]';
    
    H = compute_homography(sample_pointsz1,sample_pointsz2);
    
    d2 = compute_homography_distance(H,newp1', newp2');
    
    [num_inliers,indices] = find_inliers(d2,threshold*threshold);
    
    if (num_inliers > best_inliers)
        best_inliers = indices;
        best_H = H;
        best_pairs = [sample_points1,sample_points2] ;
    end
end
% best_inliers =
% best_pairs =
% best_h =

% format check
assert(isfloat(best_inliers) && isvector(best_inliers));
assert(isfloat(best_pairs) && all(size(best_pairs) == [4 4]));
assert(isfloat(best_H) && all(size(best_H) == [3 3]));
