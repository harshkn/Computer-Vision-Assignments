function H = compute_homography(points1,points2)
%% Estimates the homography from given correspondences
%
%   INPUTS
%     points1     4 points from first image
%     points2     4 points from second image
%
%   OUTPUTS
%     H           estimated homography
%


[U1, T1] = condition(points1);
[U2, T2] = condition(points2);
points1 = points1';
points2 = points2';
n = size(points1, 1);
A = zeros(n*3,9);
b = zeros(n*3,1);
for i=1:n
    A(3*(i-1)+1,1:3) = [points2(i,1:2),1];
    A(3*(i-1)+2,4:6) = [points2(i,1:2),1];
    A(3*(i-1)+3,7:9) = [points2(i,1:2),1];
    b(3*(i-1)+1:3*(i-1)+3) = [points1(i,1:2),1];
end
x = (A\b)';
H = [x(1:3); x(4:6); x(7:9)];
% H = mldivide(T2, H) * T1;   

% format check
assert(all(size(H) == [3 3]));
