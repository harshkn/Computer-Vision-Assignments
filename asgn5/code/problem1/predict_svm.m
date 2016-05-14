function predictions = predict_svm(features,w,b)
%% Predicts the outcome for given features based on the
% discriminant function.
%
% INPUTS:
%   features      DIMxN matrix where each column corresponds to a feature.
%   w             learned weight vector
%   b             learned bias value
%
% OUTPUTS:
%   predictions   vector of corresponding outcomes (0/1)
%%

predictions = w' * features + b;

% format check
assert(length(predictions) == size(features,2));

