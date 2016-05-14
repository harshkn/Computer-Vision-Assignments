function show_after(features,labels,w,b,svec)
%% Shows a 2-dimensional plot of the features decision boundaries and margins.
%  Also marks the support vectors.
%
% INPUTS:
%   features    2xN matrix where each column corresponds to a 2D point as in [x;y]
%   labels      1xN vector that has entries 0/1 for 'class_1'/'class_2', respectively
%   w           learned weight vector
%   b           learned bias value
%   sidx        vector containing the column indices of found support vectors in 'features'
%%

 


features = features';
 f = features(svec,:)';
 x = features(svec,:);

y = -w(1)/w(2) * x(:,1)- b/w(2);

margin = 1/norm(w);

hold on ;

y1 = -w(1)/w(2) * x(:,1)- b/w(2)+ margin;

y2 = -w(1)/w(2) * x(:,1)- b/w(2) - margin;

plot(x(:,1), y,'b');
plot(x(:,1), y2,'b');
plot(x(:,1), y1,'b');

hold on ;

scatter(x(:,1),x(:,2),'*');


