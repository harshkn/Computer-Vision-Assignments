function [U,lambda,mu,cumvar] = compute_pca(X)
%{
 Computes principal component analysis.

 Inputs:
   X        MxN entered data matrix

 Outputs:
   U        Eigenvectors of covariance matrix of X
   lambda   Eigenvalues of covariance matrix of X
   mu       mean data vector.
   cumvar   cumulative variance
%}

%X = X';
 mu = mean(X,2);

 
 M = zeros(size(X));
for i = 1:size(M,2),
    W = (X(:,i) - mu);

    M(:, i) = W(:);
    
end;



[U,S,V] = svd(M,0);
 
 eigenValues = zeros(size(S,2),1);
 for i = 1:size(S,2)
     eigenValues(i,1) = S(i,i);
 end
 cumvar = cumsum(eigenValues) /sum(eigenValues) ;
 lambda = eigenValues;
 
