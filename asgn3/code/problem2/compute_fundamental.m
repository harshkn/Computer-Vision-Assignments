function F = compute_fundamental(points1,points2)
%% Computes the fundamental matrix for given CONDITIONED points
%
%   INPUTS
%       points1     3x8 matrix of conditioned points
%       points2     3x8 matrix of conditioned points
%
%   OUTPUTS
%       F           3x3 fundamental matrix
%%

F = eightpoint(points1,points2);

F = enforce_rank2(F);


% format check
assert(all(size(F) == [3 3]));
