function [dx2,dy2,dxdy,dxdt,dydt] = compute_coefficients(dx,dy,dt,sigma,fsize)
%% Computes coefficients of linear system of equations.
%
% INPUTS:
%   dx      derivative in x-direction
%   dy      derivative in y-direction
%   dt      temporal derivative
%   sigma   standard deviation for Gaussian smoothing
%   fsize   filter size for Gaussian smoothing
%
% OUTPUTS:
%       dx2         dx*dx
%       dxdy        dx*dy
%       dy2         dy*dy
%       dxdt        dx*dt
%       dydt        dy*dt

gauss = fspecial('gaussian', fsize, sigma);
dx2 = imfilter(dx.*dx, gauss);
dy2 = imfilter(dy.*dy, gauss);
dxdy = imfilter(dx.*dy, gauss);
dxdt = imfilter(dx.*dt, gauss);
dydt = imfilter(dy.*dy, gauss);
