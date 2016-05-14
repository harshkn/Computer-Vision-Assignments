function show_matches(im1,im2,pairs)
%%
% Shows given matches on top of the images.
%
%   INPUTS
%     im1      left image
%     im2      right image
%     pairs    Mx4 matching pairs of coords.
%%

new_co2 = pairs(:,3:4);
new_co2(:,2) = new_co2(:,2) +  size(im1,2);
imshow([im1 im2]);
hold on;  
for i = 1:length(pairs)
    line(new_co2(i,1:2), pairs(i,1:2));
end