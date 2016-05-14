function [im,imrgb] = load_image(filename)
%{
 Load the rgb image and convert it to a normalized double image.
 Then convert it to a grayscale image.

 Inputs:
   filename     image file to load

 Outputs:
   im           grayscale image
   imrgb        rgb image
%}



imrgb = im2double(imread(filename));
im =  (rgb2gray(imrgb));


assert(isfloat(im) & min(im(:)) >= 0 & max(im(:)) <= 1, ...
    'The image values should be floating point numbers between 0 and 1.');
assert(isfloat(imrgb) & min(imrgb(:)) >= 0 & max(imrgb(:)) <= 1, ...
    'The image values should be floating point numbers between 0 and 1.');

