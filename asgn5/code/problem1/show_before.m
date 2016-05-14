function show_before(features,labels)
%% Shows a 2-dimensional plot where 2D feature points are
%  colored w.r.t. class labels.
%
% INPUTS
%   features    2xN matrix where each column corresponds to a 2D point as in [x;y]
%   labels      1xN vector that has entries 0/1 for 'class_1'/'class_2', respectively
%%

[x1,y1] = find(labels == 1 );
scatter(features(1,y1),features(2,y1),'r');
hold on;

[x1,y1] = find(labels == 0 );
scatter(features(1,y1),features(2,y1),'g');

legend({'Class 1', 'Class_2'});