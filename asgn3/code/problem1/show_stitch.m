function show_stitch(im1,im2,H)
%% Show a panorama stitch of the left and right image using the given
%  homography.
%
%   INPUTS
%     im1       left image
%     im2       right image
%     H         Homography
%%

large_im = meshgrid(1:700, 1:size(im1,1));
large_im(:,1:300) = im1(:,1:300);
col = 301:700;
colm1 = repmat(col, [size(im1,1) 1]);
row = 1:299;
rowm1 = repmat(row', [1 size(im1,2)]);


t_coordin = H * [colm1(:) rowm1(:) ones(length(rowm1(:)),1)]';
homt_coordin = hom2cart(t_coordin);

col = 1:400;
colm2 = repmat(col, [size(im1,1) 1]);
row = 1:299;
rowm2 = repmat(row', [1 size(im1,2)]);


tranformed_im = interp2(colm2,rowm2,  im2,homt_coordin(1,:), homt_coordin(2,:));
im2_t = reshape(tranformed_im, size(im2));

large_im(:,301:end) = im2_t;

imshow(large_im);


test = 0;