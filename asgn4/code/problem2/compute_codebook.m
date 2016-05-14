function codebook = compute_codebook(X,K)
%% Builds a codebook for a given data matrix by k-means clustering.
%
% INPUTS
%   X           DIMxN data matrix where DIM is the dimension of the data
%               and N is the number of samples.
%   K           number of cluster centers (keypoints) to use for the codebook.
%
% OUTPUTS
%   codebook    DIMxK matrix where each column corresponds to a keypoint in the resulting codebook.
%%

%  [~, ~, ~, codebook] = kmeans(X,K);

    n = size(X,2);
    last = 0;
    t  = 0;
    label = ceil(K*rand(1,n));  % random initialization
    while any(label ~= last)
        E = sparse(1:n,label,1,n,K,n);  % transform label into indicator matrix
        codebook = X*(E*spdiags(1./sum(E,1)',0,K,K));    % compute m of each cluster
        last = label;
        [~,label] = max(bsxfun(@minus,codebook'*X,dot(codebook,codebook,1)'/2),[],1); % assign samples to the nearest centers
    end  

codebook = codebook * 100;
    
    




    
% format check
assert(all(size(codebook) == [size(X,1) K]));
