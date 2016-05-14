function display_pyramid(P)
%{
 Displays a given image pyramid.

 Inputs:
   P   cell array of images in decreasing order
%}

rows = size(P{1},1);

newIm = P{1};
for curLevel = 1: numel(P) - 1
    curImSize = size(P{curLevel+1});
    appendZero = zeros(rows - curImSize(1), curImSize(2));
    newIm = [newIm [P{curLevel+1}; appendZero]];
end

%% normalizing in case values not within 0 and 1
normNewIm = mat2gray(newIm);
imshow(normNewIm);


