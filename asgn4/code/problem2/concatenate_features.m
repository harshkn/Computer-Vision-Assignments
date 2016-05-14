function X = concatenate_features(features)
%% Build a (concatenated) feature matrix from the given cell array of features.
%
% INPUTS
%   features          (1 x num_samples) cell array of features.
%
% OUTPUTS
%   X                 data matrix of size 128xN, where N is the number of all interest points
%                     in all images.
%%

X = cell2mat(features);

% format check
assert(size(X,1) == 128);
