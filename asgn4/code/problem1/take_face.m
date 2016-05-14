function faceim = take_face(data, facedim, index)
%{
 takes one face out of the database.

 Inputs:
   data       Loaded face database
   facedim    2D face image dimensions [rows,cols]
   index      index of image in database

 Outputs:
   faceim     a single face image
%}

faceim = reshape(data(:,index),facedim);
