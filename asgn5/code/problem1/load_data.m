function [features,labels] = load_data(fn)
%% Loads features/labels from file.
%
% INPUTS
%   fn          filename
%
% OUTPUTS
%   features    2xN matrix where each column corresponds to a 2D point as in [x;y]
%   labels      1xN vector that has entries 0/1 for 'class_1'/'class_2', respectively
%%

x = load(fn);
features = x.features;
labels = x.labels;

labels(strcmp('class_1', labels))= {0};
labels(strcmp('class_2', labels))= {1};
labels = cell2mat(labels);

% format check
assert(size(features,1) == 2 && size(labels,1) == 1 && ...
       size(features,2) == size(labels,2));
