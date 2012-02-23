function h = SM_Plot3d(GX,GY,GZ,GV,xslice,yslice,zslice)
%   PLOT3D   Creates 3d slice plot of gridded data
%       [H] = SM_PLOT3D(X,Y,Z,GRD,XSLICE,YSLICE,ZSLICE)
% 
%   Creates 3d slice plot of gridded data, xslice, yslice, and zslice
%   are x, y, and z coordinates for a slice. For multiple slices along 
%	one axis input use xlice = [x1 x2].
%   
%   Created by Alan Baird on 2012-02-06.
%   Copyright (c)  . All rights reserved.

h = slice(GX,GY,GZ,GV,xslice,yslice,zslice);
%view(3);
view([37.5 25]);
axis on;
grid on;
%light;
%lighting phong;
%camlight('left');
shading interp;
colorbar;
axis tight;
axis equal;

end %  function