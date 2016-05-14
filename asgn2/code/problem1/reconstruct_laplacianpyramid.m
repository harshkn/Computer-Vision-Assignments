function im = reconstruct_laplacianpyramid(L,fsize)
%{
Reconstruct the image from the Laplacian pyramid.

 Inputs:
   L         cell array of images in decreasing order.
   fsize     binomial filter dimensions.

 Outputs:
   im        reconstructed sharpened high resolution image.
%}

im = L{numel(L)};

for curImage = numel(L):-1:2
    upsampledIm = upsample2(im, fsize);
    im = upsampledIm + L{curImage - 1};
end

