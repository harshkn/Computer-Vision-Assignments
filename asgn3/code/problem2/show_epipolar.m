function show_epipolar(F,p,im)
%%  Draws epipolar lines on top of the image
%
%   INPUTS
%     F       fundamental matrix
%     points  8x2 coords of points in the given image
%     im      image
%%
% get plot limits from current graph

colormap(gray);
imagesc(im)
hold on
    
    % for all input points
    for i=1:size(p,1)
%         l = F*p(i,:)';
%         y = (-l(3) - l(1)*xlim) / l(2);
%         hold on
%         hh = plot(xlim, y, '--');
%         h = [h; hh];
%         hold off
line = F*[p(i,:) 1]';

        points_x = [0,size(im,2)];
        points_y = [(-points_x(1)*line(1)-line(3))/line(2)...
            (-points_x(2)*line(1)-line(3))/line(2)];

        plot(p(i,1),p(i,2),'r.','MarkerSize',20)                         
        plot(points_x,points_y);
    end
   

end