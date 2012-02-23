function [GX,GY,GZ,GV] = SM_Makegrid(x,y,z,v,dx)
% 	SM_MAKEGRID   Short description
% 		[GX,GY,GZ,GV] = SM_MAKEGRID(X,Y,Z,V,DX)
% 
% 	Long description
% 	
% 	Created by Alan Baird on 2012-02-08.
% 	Copyright (c)  . All rights reserved.

% Set grid coordinates (full model range, gris spacing defined by dx)
xlin=min(x):3*dx:max(x);
ylin=min(y):3*dx:max(y);
zlin=min(z):dx:max(z);
% Create the grid of coordinates
[GX,GY,GZ]=meshgrid(xlin,ylin,zlin);
% Interpolate unevenly spaced data
F=TriScatteredInterp(x,y,z,v);
% Create grid of data values
GV=F(GX,GY,GZ);


end %  function




