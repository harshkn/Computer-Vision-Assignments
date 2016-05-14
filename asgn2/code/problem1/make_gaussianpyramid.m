function G = make_gaussianpyramid(im, nlevels, fsize, sigma)
%{
 Builds a Gaussian image pyramid.
 For filtering steps, apply symmetric boundary conditions and make sure
 that filtered images have the same size as corresponding inputs.

 Inputs:
   im        high resolution input image.
   nlevels   number of pyramid levels.
   fsize     gaussian filter dimensions.
   sigma     gaussian filter standard deviation

 Outputs:
   G         cell array of images in decreasing order.
%}

gfilter = make_gaussian_filter(fsize,sigma);
% sum(gfilter(:)) %==1
G = cell(nlevels,1);
G{1} = im;
for curLevel = 1:nlevels - 1
    curImage = G{curLevel};
    newImage = imfilter(curImage, gfilter,'symmetric');
    G{curLevel + 1} = downsample2(newImage);
end

%format check
assert(iscell(G));

end
