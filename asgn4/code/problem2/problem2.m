%--------------------------------------------------------------------------------------------
% NOTE 1: class 0 should correspond to airplanes
%         class 1 should correspond to motorbikes
%
% NOTE 2: To keep the code organized, we recommend to use structures in order to
%         represent the training and testing set, i.e.
%
%           training.inputs           testing.inputs
%           training.features         testing.features
%            ...                       ...
%
% NOTE 3: Since computing features and/or computing the codebook can take a while,
%         you may save and reuse computed features for debugging purposes.
%         In Matlab you can store workspace variables to a file by
%         calling save(filename,'variablename'). In order to restore saved variables back
%         into the workspace just call load(filename).
%--------------------------------------------------------------------------------------------

% Parameters for features extraction
params.fsize = 15;       % Harris filter size
params.sigma = 1.4;      % Harris filter sigma
params.threshold = 1e-7; % Harris threshold
params.boundary = 10;    % boundary for interest points
K = 50;                  % number of keypoints in codebook


%--------------------------------------------------------------------------------------------
% 1) CREATE CODEWORD DICTIONARY from training data
%--------------------------------------------------------------------------------------------

% Load training/testing data (using load_data)
[training.inputs,testing.inputs] = load_data('../../data/planes','../../data/bikes');


% extract features of interest points for training/testing inputs (using extract_features)
train_ft = extract_features(training.inputs.images,params);
test_ft = extract_features(testing.inputs.images,params);

% construct a single (concatenated) feature matrix from (only) the training data
% (using concatenate_features)
X = concatenate_features(train_ft);

%  build a codeword dictionary from the feature matrix (using compute_codebook)

codebook = compute_codebook(X,K);

%--------------------------------------------------------------------------------------------
% 2) Categorize images with naive Bayes classifier
%--------------------------------------------------------------------------------------------
% Compute histograms over the codebook for training/testing features (using compute_histogram)
train_histogram = compute_histogram(train_ft,codebook,K);
test_histogram = compute_histogram(test_ft,codebook,K);

% Train a Naive Bayes Classifier by means of the training histograms (using train_bayes)
bayes_classifier = train_bayes(training.inputs.labels,training.inputs.num_samples,train_histogram,K);

% Compute log posteriors for training/testing data (using compute_posterior)
 
[lp_c0_train,lp_c1_train] = compute_posterior(bayes_classifier,train_histogram);
[lp_c0_test,lp_c1_test] = compute_posterior(bayes_classifier,test_histogram);
 
% Compute the predictions as well as the error rate for training/testing data (using test_bayes)

[pred_train,error_train] = test_bayes(lp_c0_train,lp_c1_train,training.inputs.labels);

[pred_test,error_test] = test_bayes(lp_c0_test,lp_c1_test,testing.inputs.labels);

% display error rate
fprintf('Error rate of training is %0.2f percent \n', error_train);
fprintf('Error rate of testing is %0.2f percent \n', error_test);


