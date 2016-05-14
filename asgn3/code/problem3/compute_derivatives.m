function [dx,dy,dt] = compute_derivatives(im1,im2)
%% Computes first-order derivatives of a given image pair
%
%   INPUTS:
%       im1     first frame
%       im2     second frame
%
%   OUTPUTS:
%       dx      spatial derivative in x-direction
%       dy      spatial derivative in y-direction
%       dt      spatial derivative in time
%%
d = [-1 0 1]/2;
dx = imfilter(im1, d);
dy = imfilter(im1, d');
dt = im2 - im1;
