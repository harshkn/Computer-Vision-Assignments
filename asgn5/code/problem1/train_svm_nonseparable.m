function [w,b,sidx] = train_svm_nonseparable(features,labels,C)
%% Trains a Support Vector machine for non-separable training data.
%
% INPUTS
%   features    DIMxN feature matrix where each column corresponds to a feature and
%               where DIM is the feature dimension and N is the overall number of features.
%   labels      1xN vector that has entries 0/1 for corresponding classes.
%%
% OUTPUTS
%   w           learned weight vector
%   b           learned bias value
%   sidx        vector containing the column indices of found support vectors in 'features'
%%
labels = (2 * labels) - 1;
[cw,nimages] = size(features);
H = eye(cw + 1 + nimages);
H(cw + 1:end, cw + 1:end) = 0;
f = [zeros(cw + 1, 1); C * ones(nimages, 1)];
A = - (repmat(labels, cw + 1, 1 ) .* [features; ones(1, nimages)])';
A = [A, -eye(nimages)];
A = [A; zeros(nimages, cw + 1), -eye(nimages)];
b = [-ones(nimages,1); zeros(nimages, 1)];

wq = quadprog(H, f, A, b);

w = wq(1:cw);
b = wq(cw +1);


tolerance = 0.0001;
l = labels'.*(features'*w+b*ones(nimages,1));
sidx = find(abs(abs(l)-1)<tolerance);
g =1;


    


