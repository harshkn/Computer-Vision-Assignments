function him = upsample2(lim,fsize)
%{
 Upsamples an image by factor of 2.

 Inputs:
   lim       low resolution input image.
   fsize     binomial filter dimensions.

 Outputs:
   him       high resolution output image,
%}
factor = 2;
sizeIm = factor * size(lim);
upSampledIm = zeros(sizeIm);
upSampledIm(1:2:end, 1:2:end) = lim;
bfilter = make_binomial_filter(fsize);
him = 4 * imfilter(upSampledIm, bfilter,'symmetric');
end
