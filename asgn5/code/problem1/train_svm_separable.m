function [w,b,sidx] = train_svm_separable(features,labels)
%% Trains a Support Vector machine for linearly separable training data.
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


datapoints = features';
labels(labels == 0) = -1;
y = labels';

[cw, npoints] = size(datapoints);
H=diag([ones(1,npoints) 0]);
f=zeros(1,npoints+1);
A=-diag(y)*[datapoints ones(cw,1)];
b= -ones(cw,1);

wq=quadprog(H,f,A,b);

w=wq(1:npoints);
b=wq(npoints+1);

tolerance = 0.0001;
l = y.*(datapoints*w+b*ones(cw,1));
sidx = find(abs(abs(l)-1)<tolerance);

