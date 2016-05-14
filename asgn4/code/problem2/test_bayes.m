function [predictions,error] = test_bayes(lp_c0,lp_c1,labels)
%% Computes resulting predictions and the error rate.
%
% INPUTS
%   lp_c0           log class posteriors for class 0
%   lp_c1           log class posteriors for class 1
%   labels          (Ground truth) labels
%
% OUTPUTS
%   predictions     vector of length num_samples that is the final prediction (0/1) by means
%                   of the log posteriors.
%
%   error           error rate (for given posteriors/ground truth labels)
%%

difPost = (lp_c1 - lp_c0);

predictions = (difPost .* (labels - 0.5)) < 0;

error = (sum((labels ~= predictions)) / numel(labels)) * 100;
% format check
assert(length(predictions) == length(lp_c0));
