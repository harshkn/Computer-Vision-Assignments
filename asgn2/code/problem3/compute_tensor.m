function [dx2,dy2,dxdy] = compute_tensor(img,sigma,fsize)
%{
 Calculate the structure tensor for the Harris detector. Use the replicate
 option at the boundary for filtering.

 Inputs:
   img     grayscale image
   sigma   sigma for gaussian filter
   fsize   window size for filter

 Outputs:
   dx2      dx*dx
   dy2      dy*dy
   dxdy     dx*dy
%}
g = fspecial('gaussian',fsize,sigma);
imgFiltered   = imfilter(img, g, 'replicate','conv');

mask = 0.5 .* [-1 0 1]; %central difference
Ix = imfilter(imgFiltered, mask, 'replicate','conv'); 
Iy = imfilter(imgFiltered, mask','replicate','conv');
% Ix = conv2(imgFiltered,mask,'same');
% Iy = conv2(imgFiltered,mask','same');

gTilde = fspecial('gaussian',fsize, 1.6*sigma);
dx2   = imfilter(Ix.^2, gTilde, 'replicate','conv'); 
dy2   = imfilter(Iy.^2, gTilde, 'replicate','conv'); 
dxdy  = imfilter(Ix.*Iy, gTilde, 'replicate','conv');

end


