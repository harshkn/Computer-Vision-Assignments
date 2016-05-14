function lim = downsample2(him)
% Downsamples an image by factor of 2.
%
% Inputs:
%   him       high resolution input image.
%
% Outputs:
%   lim       low resolution output image,

lim = him(1:2:end, 1:2:end);

end
