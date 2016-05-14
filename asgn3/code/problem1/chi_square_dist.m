function D = chi_square_dist(features1,features2)
%% Computes pairwise Chi squared distances for given
% features
%
%   INPUTS
%     features1      [M1x128] sift features of left image
%     features2      [M2x128] sift features of right image
%
%   OUTPUTS
%     D              pairwise distance matrix of size M1xM2
%%

countRowsF1 = size(features1, 1); % number of rows in features1
countRowsF2 = size(features2, 1); % number of rows in features2

D = zeros(countRowsF1 , countRowsF2); % pre-initialize with zeros

for r1 = 1:countRowsF1
    for r2 = 1:countRowsF2
        f1 = features1(r1,:);
        f2 = features2(r2,:);
        temp = ((f1 - f2).^2)./(f1+f2);
        D(r1,r2) = sum(temp);
    end
end

% format check
assert(isfloat(D) && all(size(D) == [size(features1,1) size(features2,1)]));

