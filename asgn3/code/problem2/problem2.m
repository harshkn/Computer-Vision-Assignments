% If not yet implemented you will have to implement function condition
% of problem1. This will make you have the function available for this problem..
addpath(genpath('../problem1'));
addpath(genpath('../../data'));


% Load the images and data:
im1 = im2double(imread('a3p2a.png'));
im2 = im2double(imread('a3p2b.png'));
load('points.mat'); % gives you points1 and points2 variables
pointsn1 = [points1 ones(length(points1), 1)]';
pointsn2 = [points1 ones(length(points2), 1)]';
[u1 t1] = condition(pointsn1);
[u2 t2] = condition(pointsn2);
colormap(gray);
% Display the correspondences:
subplot(2,2,1);
imagesc(im1);
hold on;
plot(points1(:,1),points1(:,2),'*');
hold on;
subplot(2,2,2);
imagesc(im2);
hold on
plot(points2(:,1),points2(:,2),'*');


% Compute the fundamental matrix using 'eightpoint':

F = compute_fundamental(u1,u2);

F = t2'*F*t1;
% Draw epipolar lines using 'show_epipolar':
subplot(2,2,3);
show_epipolar(F,points1,im1)
hold on
subplot(2,2,4);
% im2 = flipdim(im2 ,2); 
show_epipolar(F,points2,im2)
hold on
% Check the epipolar constraints by computing the reprojection error:

sum(pointsn2' * F .* pointsn1' ,2)
%All errors are small (approx -10^-15)




