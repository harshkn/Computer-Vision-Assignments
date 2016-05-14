function L = make_laplacianpyramid(G, nlevels, fsize)
%{
 Builds a Laplacian image pyramid.

 Inputs:
   G         gaussian pyramid as cell array
   nlevels   number of pyramid levels.
   fsize     binomial filter dimensions

 Outputs:
   L         cell array of images in decreasing order.
%}


L =  cell(nlevels,1);
for curLevel = 1:nlevels - 1
    nxtGImage = G{curLevel+1};
    nxtUpScaledIm = upsample2(nxtGImage,fsize);
    L{curLevel} = G{curLevel} - nxtUpScaledIm;
%     imshow(nxtUpScaledIm)
end

L{curLevel + 1} = G{curLevel + 1};

% format check
assert(iscell(L));

end
