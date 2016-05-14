function n = compute_ransac_iterations(p,k,z)
%% Computes the estimated number of iterations for RANSAC.
%
%   INPUTS
%     p    probability that any given correspondence is valid
%     k    number of samples drawn per iteration
%     z    total probability of success after all iterations
%
%   OUTPUTS
%       n   number of requried iterations estimated

num = log(1 - z);
den = log(1 - (p ^ k));
n = ceil(num/den);
