function [U,T] = condition(points)
%% Returns conditioned points and conditioning matrix
%
%   INPUTS
%       points  3xN matrix of N points in homogeneous coordinates.
%
%   OUTPUTS
%       U       3xN matrix of conditioned points
%       T       3x3 conditioning matrix
%%

t = mean(points, 1);
sp = sum(points.^2);
s = max(sqrt(sp))/2;

T = [1/s  0  -t(1)/s; 0 1/s -t(2)/s; 0 0 1 ];
U = T * points;

