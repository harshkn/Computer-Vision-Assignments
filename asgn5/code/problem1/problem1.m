% 
%------------------------------------------------------------------
% SEPARABLE CASE
%------------------------------------------------------------------
disp('(1) SEPARABLE');

% load training data (separable)
[features,labels] = load_data('../../data/separable.mat');

% plot feature points with labels (using show_before)

% SVMStruct = svmtrain(features',labels','showplot',true)
figure(1)
show_before(features,labels);
% train SVM (using train_svm_separable)

[w,b,svec] = train_svm_separable(features,labels);

% Show weights and bias on command window
fprintf(' Weights : \n');
disp(w)
fprintf(' Bias : %f \n', b);


% Plot points with labels, decision boundaries, margins, support vectors (using show_after)

show_after(features,labels,w,b,svec);


%------------------------------------------------------------------
% NON-SEPARABLE CASE
%------------------------------------------------------------------
disp('(2) NON-SEPARABLE');

%% load training data (nonseparable)
[features,labels] = load_data('../../data/nonseparable.mat');



% plot points with labels (using show_before)
figure(2)
show_before(features,labels)

% choose weight of C=5 to penalize deviations
C = 5;


% train SVM (using train_svm_nonseparable)
[w,b,sidx] = train_svm_nonseparable(features,labels,C);

% Report weights and bias on command window
fprintf(' Weights : \n');
disp(w)
fprintf(' Bias : %f \n', b);


% Plot points with labels, decision boundaries, margins, support vectors (using show_after)
show_after(features,labels,w,b,sidx);




%--------------------------------------------------------------------
% APPLY SVM to airplane/motorbike classification of assignment 4
%--------------------------------------------------------------------

%% Load data from asgn4
[train_features,train_labels,test_features,test_labels] = load_asgn4('../../data/asgn4data.mat');


% choose weight to penalize deviations
C = 10;


% train SVM on training data (using train_svm_nonseparable)
[w,b,~] = train_svm_nonseparable(train_features,train_labels,C);


% predict classes for both training/testing sets (using predict_svm)

predictions_train = predict_svm(train_features,w,b);
predictions_test = predict_svm(test_features,w,b);

% show errors of both training/testing set on command window
a_pred = sum((predictions_train > 0) ~= train_labels ) ;
err = (a_pred / numel(predictions_train) * 100);
fprintf(' Error for training set : %2.2f percent\n', err);

a_pred = sum((predictions_test > 0) ~= test_labels ) ;
err = a_pred/ numel(test_labels) * 100;
fprintf(' Error for training set : %2.2f percent\n', err);

