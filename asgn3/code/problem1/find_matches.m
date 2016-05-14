function pairs = find_matches(keypoints1,keypoints2,D)
%%
% Find one-to-one mappings between keypoints of left/right image by means of
% the distance matrix. The number of correspondences should be chosen
% depending on the number of keypoints: As a reference for one-to-one mappings
% we take the image that has a smaller number of keypoints.
%
%   INPUTS
%     keypoints1    keypoints of left image
%     keypoints2    keypoints of right image
%     D             pairwise distance matrix
%
%   OUTPUTS
%     pairs         Mx4 correspondences (putative matching pairs)
%%
%%

pairs = [];
if(numel(keypoints1) < numel(keypoints2))
    [x,ix] = sort(D, 2,'ascend');
    [y,iy] = sort(D, 1,'ascend');
    n_p1 = ix(:,1);
    n_p2 = iy(1,:);
    for ind = 1:(numel(keypoints1)/2)
        if( ind == n_p2(n_p1(ind)))
            pairs = [pairs; keypoints1(ind,2), keypoints1(ind,2), keypoints2(n_p1(ind),2) keypoints2(n_p1(ind),1)];
        end
    end
end

% format check
assert(isfloat(pairs) && size(pairs,2) == 4);
