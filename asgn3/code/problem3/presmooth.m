function ims = presmooth(im,sigma,fsize)
%% Smoothes a given image with a Gaussian filter.
%
%   INPUTS
%     im          image
%     sigma       standard deviation
%     fsize      filter size
%
%   OUTPUTS
%     ims         smoothed image
%%
gauss = fspecial('gaussian', fsize, sigma);
ims = imfilter(im, gauss);
