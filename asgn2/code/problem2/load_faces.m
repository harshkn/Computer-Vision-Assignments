function [data, facedim, nfaces] = load_faces(fdir)
%{
 Loads images from yale database.

 Inputs:
   fdir       Root directory containing the face images.

 Outputs:
   data       linearized and concatenated image data with size MxN,
              where M is is the number of pixels per face, and N
              is the number of face images
   facedim    2D face image dimensions [rows,cols]
   nfaces     number of all face images
%}
folder = 'yaleBs';

data = zeros(8064,(20*38));
totalImages = 1;
for j = 1:38
    if (j< 10)
        folderName = strcat(folder,'0',int2str(j));
    else
        folderName = strcat(folder,int2str(j));
    end
    for i = 1:20
        
        if (i<10)
            y = imread( strcat('../../data/yale_faces/',folderName,'/01','.pgm'));
            x = im2double(imread( strcat('../../data/yale_faces/',folderName,'/0',int2str(i),'.pgm')));
        else
            x = im2double(imread( strcat('../../data/yale_faces/',folderName,'/',int2str(i),'.pgm')));
        end
        data(:,totalImages) = x(:);
        totalImages = totalImages + 1 ; 
    end
end

%data = ;
facedim =[96 84] ;
nfaces = 38;

% format check
assert(isfloat(data) && 0 <= min(data(:)) && max(data(:)) <= 1);
