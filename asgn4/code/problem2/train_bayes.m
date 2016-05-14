function bayes_classifier = train_bayes(labels,num_samples,histogram,K)
%%
% Train a naive Bayes classifier for separating two classes.
%
% INPUTS:
%   labels              vector of class labels (0/1)
%   num_samples         number of samples
%   histogram           K x num_samples matrix, that assembles the histograms
%                       for all images (over the codebook).
%   K                   number of keypoints in codebook.
%
% OUTPUTS:
%    bayes_classifier   structure with following fields:
%       prior_c0          prior class 0
%       prior_c1          prior class 1
%       pc_c0             vector of length K corresponding to the class-conditional probabilities of each
%                         keyword for class 0
%       pc_c1             vector of length K corresponding to the class-conditional probabilities of each
%                         keyword for class 1
%%
bayes_classifier.prior_c1 = sum(labels)/num_samples;
bayes_classifier.prior_c0 =  1- bayes_classifier.prior_c1;

sumc = sum(histogram(:, (labels == 0)), 2);
bayes_classifier.pc_c0 = (1 + sumc )/ (K + sum(sumc(:)));
sumc = sum(histogram(:, (labels == 1)), 2);
bayes_classifier.pc_c1 = (1 + sumc )/ (K + sum(sumc(:)));

% format check
assert(isstruct(bayes_classifier) & isfield(bayes_classifier,'prior_c0') & ...
       isfield(bayes_classifier,'prior_c1') &  isfield(bayes_classifier,'pc_c0') & ...
       isfield(bayes_classifier,'pc_c1') & length(bayes_classifier.pc_c0) == K & ...
       length(bayes_classifier.pc_c1) == K);
