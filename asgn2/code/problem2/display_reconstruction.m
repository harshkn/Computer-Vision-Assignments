function display_reconstruction(faceim,f5,f15,f50,f150)
%{
 displays the reconstructed faces and the original in one plot

 Inputs:
   faceim   original face
   f5       face reconstruction using 5   components
   f15      face reconstruction using 15  components
   f50      face reconstruction using 50  components
   f150     face reconstruction using 150 components
%}
figure();
%% to be completed
subplot(1,2,1);
uint8(faceim);
imshow(faceim);
subplot(1,2,2);
uint8(f150);
imshow(f150);
%imagesec(f150);
%colormap(gray);