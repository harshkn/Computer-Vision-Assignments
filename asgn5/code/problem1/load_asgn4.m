function [train_features,train_labels,test_features,test_labels] = load_asgn4(fn)
%% Loads assignment4 features/labels from file.
%
% INPUTS:
%   fn          filename (of asgn4 file)
%
% OUTPUTS:
%   train_features    DIMxN matrix where each column corresponds to a DIM dimensional feature
%   train_labels      1xN vector that has entries 0/1 for respective classes
%
%   test_features     DIMxN matrix where each column corresponds to a DIM dimensional feature
%   test_labels       1xN vector that has entries 0/1 for respective classes
%%
x = load(fn);

train_labels   = x.training.inputs.labels;
test_labels    = x.testing.inputs.labels;

train_features = zeros(size(x.training.histogram));
test_features = zeros(size(x.testing.histogram));
for i= 1: numel(train_labels)
    train_features(:,i) = (x.training.histogram(:,i) / sum(x.training.histogram(:,i)));
end
for i= 1: numel(test_labels)
    test_features(:,i) = (x.testing.histogram(:,i) / sum(x.testing.histogram(:,i)));
end





% format check
assert(min(train_features(:))>=0 & max(train_features(:))<=1);
assert(min(test_features(:))>=0 & max(test_features(:))<=1);
