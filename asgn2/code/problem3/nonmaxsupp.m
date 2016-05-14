function [px,py] = nonmaxsupp(harris,thresh)
%{
 Apply non-maximum suppression on the result to extract the local maxima
 with a 5x5 window. Do not pad the image at the boundarys. Allow multiple
 equal maxima in one cell. Take points which are above the given threshold only.

 Inputs:
   harris   harris image
   thresh   threshold for non-maximum suppression

 Outputs:
   px      x-coordinates for obtained points
   py      y-coordinates for obtained points
%}

[row ,col] = size(harris);
for i= 3:row-3
    for j = 3:col-2
        
        currPixel = harris(i,j);
        window = harris(i-2:i+2,j-2:j+2);
        if (currPixel < max(max(window(:))))
            harris(i,j) = 0;
        end
    end
end


 [px,py] =  find (harris > thresh);
end

% harris_bar = padarray(harris,[2 2], -realmax);
% windows = im2col(harris_bar, [5 5]);
% maxima = max(windows);
% 
% ismax = reshape(maxima == windows(c,:), size(harris));
% mask = (harris .* ismax) > thresg;
% [py, px] = find(mask);


