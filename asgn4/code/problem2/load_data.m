function [training_inputs,testing_inputs] = load_data(dir_planes,dir_bikes)
%% Creates input structures by randomly separating the images
% into two equally sized sets for training/testing, respectively.
%
% INPUTS
%   dir_planes    Root folder of all airplane images
%   dir_bikes     Root folder of all motorbike images
%
% OUTPUTS
%   training_inputs    structure with following fields:
%      images            (1 x num_samples) cell array with random training images
%      labels            vector of length num_samples
%                        (should be '0' for an airplane and '1' for a motorbike)
%      num_samples       number of images in training set
%
%   testing_inputs    structure with following fields:
%      images            (1 x num_samples) cell array with random testing images
%      labels            vector of length num_samples
%                        (should be '0' for an airplane and '1' for a motorbike)
%      num_samples       number of images in testing set
%%
file_planes0 = dir([dir_planes '/*.png']);
file_bikes1 = dir([dir_bikes '/*.png']);

num = numel(file_planes0);
rnum = randperm(num);
training_inputs.images = {};
training_inputs.labels = [];
testing_inputs.images = {};
testing_inputs.labels = [];
for i = 1:num
    imagef = double(imread([dir_planes '/' file_planes0(rnum(i)).name]));
    if(i <= (num/2))
        training_inputs.images = cat(2, training_inputs.images,imagef);
        training_inputs.labels = [training_inputs.labels 0];
    else
        testing_inputs.images = cat(2, testing_inputs.images,imagef);
        testing_inputs.labels = [testing_inputs.labels 0];
    end
end
num = numel(file_bikes1);
rnum = randperm(num);
for i = 1:num
    imagef = double(imread([dir_bikes '/' file_bikes1(rnum(i)).name]));
    if(i <= (num/2))
        training_inputs.images = cat(2, training_inputs.images,imagef);
        training_inputs.labels = [training_inputs.labels 1];
    else
        testing_inputs.images = cat(2, testing_inputs.images,imagef);
        testing_inputs.labels = [testing_inputs.labels 1];
    end
end
training_inputs.num_samples = numel(training_inputs.images);
testing_inputs.num_samples = numel(testing_inputs.images);

% format check
fcheck = @(data) assert(isstruct(data) & isfield(data,'images') & ...
    isfield(data,'labels') & isfield(data,'num_samples') & iscell(data.images) & ...
    isvector(data.labels) & size(data.images,1)==1);
fcheck(training_inputs), fcheck(testing_inputs);
