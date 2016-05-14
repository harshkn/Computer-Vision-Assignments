function cartesian_points = hom2cart(homogeneous_points)
%% converts points from homogeneous coordinates to cartesian 3d

cartesian_points = bsxfun(@rdivide, ...
    homogeneous_points(1:end-1,:), ...
    homogeneous_points(end,:));

