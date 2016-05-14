function display_images_p3(img1, img2)
%% displays two images in one figure.
%%
%   YOUR CODE GOES HERE
figure(1)
subplot(1,2,1), imagesc(img1);
title('dx - In x direction');
subplot(1,2,2), imshow(img2);
title('dy - In y direction');


end