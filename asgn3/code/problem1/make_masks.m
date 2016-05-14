function [im1mask,im2mask] = make_masks(height,width,boundary)
%% creates masks for left and right image such that only the right half of the
%  left image and the left half of the right image are valid. Pixels within a
%  boundary are also invalid.
%
%   INPUTS
%     height      image heigth
%     width       image width
%     boundary    boundary width (these should be zero!)
%
%   OUTPUTS
%     im1mask     mask for left image
%     im2mask     mask for right image
%%

im = ones(height, width);
im(:, [1:boundary,end-boundary+1:end]) = 0;
im([1:boundary,end-boundary+1:end], :) = 0;
imt = im;
im(:,floor(end/2)) = 0;
im1mask = im==1;
% im = ones(height, width);
% im(:, 1:boundary) = 0;
imt(:,1:floor(end/2):end) = 0;
im2mask = imt==1;

% format check
assert(islogical(im1mask) && islogical(im2mask));
