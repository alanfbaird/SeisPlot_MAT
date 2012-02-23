function fign=SM_Plot3d_comp(GX,GY,GZ,GV,xslice,yslice,zslice,printname)
%   PLOT3D   Creates 3d slice plot of gridded data
%       [H] = SM_PLOT3D(X,Y,Z,GRD,XSLICE,YSLICE,ZSLICE)
% 
%   Creates 3d slice plot of gridded data, xslice, yslice, and zslice
%   are x, y, and z coordinates for a slice. For multiple slices along 
%	one axis input use xlice = [x1 x2].
%   
%   Created by Alan Baird on 2012-02-06.
%   Copyright (c)  . All rights reserved.

%hAx(1) = subplot(2,3,[1 2]); h = slice(GX,GY,GZ,GV,xslice,yslice,zslice); view([37.5 25]);
%hAx(2) = subplot(2,3,3); copyobj(h,hAx(2)); view(0,90)
%hAx(3) = subplot(2,3,[4 5]); copyobj(h,hAx(3)); view(90,0) 
%hAx(4) = subplot(2,3,6); copyobj(h,hAx(4)); view(0,0)




[ylen,xlen,zlen]=size(GX);


yyx=(0.7*ylen)/(ylen+xlen);
xyx=(0.7*xlen)/(ylen+xlen);
zzy=(0.7*zlen)/(zlen+ylen);
yzy=(0.7*ylen)/(zlen+ylen);

aratio=(ylen+xlen)/(zlen+ylen)

height=1.0/aratio;
width=1.0;
scale=1000;
xpos=50;
ypos=500;


fign=figure;

set(gcf,'Position',[xpos ypos scale*width scale*height]) % Set figure format

hAx(1) = subplot('Position',[0.1 (0.1+zzy+0.1) yyx yzy]); h = slice(GX,GY,GZ,GV,xslice,yslice,zslice); view([37.5 25]);
colorbar('location','southoutside')
hAx(2) = subplot('Position',[(0.1+yyx+0.1) (0.1+zzy+0.1) xyx yzy]); copyobj(h,hAx(2)); view(0,90)
hAx(3) = subplot('Position',[0.1 0.1 yyx zzy]); copyobj(h,hAx(3)); view(90,0) 
hAx(4) = subplot('Position',[(0.1+yyx+0.1) 0.1 xyx zzy]); copyobj(h,hAx(4)); view(0,0)


%hAx(1) = subaxis(2,2,1); h = slice(GX,GY,GZ,GV,xslice,yslice,zslice); view([37.5 25]);
%hAx(2) = subaxis(2,2,2); copyobj(h,hAx(2)); view(90,90)
%hAx(3) = subaxis(2,2,3); copyobj(h,hAx(3)); view(0,0) 
%hAx(4) = subaxis(2,2,4); copyobj(h,hAx(4)); view(90,0)


for i=1:4
	axis(hAx(i), 'on')
	grid(hAx(i), 'off')
	axis(hAx(i), 'equal')
	axis(hAx(i), 'tight')
	shading(hAx(i), 'interp')
end



if nargin==8
	hgexport(gcf, printname, ...
	hgexport('factorystyle'), 'Format', 'epsc');
end



%set(gcf, 'PaperUnits','inches');
%set(gcf, 'PaperSize', [(8/aratio) 20]);
%

%linkaxes(hAx,'x')


%hc = colorbar('Peer',hAx(1));
%
%h=figure;
%subplot(2,2,2);
%slice(GX,GY,GZ,GV,xslice,yslice,zslice);
%%view(3);
%view([37.5 25]);
%axis on;
%grid on;
%%light;
%%lighting phong;
%%camlight('left');
%shading interp;
%axis tight;
%axis equal;
%
%subplot(2,2,1);
%slice(GX,GY,GZ,GV,xslice,yslice,zslice);
%%view(3);
%axis on;
%grid on;
%shading interp;
%axis tight;
%axis equal;
%view([0 90]);
%
%subplot(2,2,3);
%slice(GX,GY,GZ,GV,xslice,yslice,zslice);
%%view(3);
%axis on;
%grid on;
%shading interp;
%axis tight;
%axis equal;
%view([0 0]);
%
%subplot(2,2,4);
%slice(GX,GY,GZ,GV,xslice,yslice,zslice);
%%view(3);
%axis on;
%grid on;
%shading interp;
%axis tight;
%axis equal;
%view([90 0]);
%
%c=colorbar;
%set(c,'Position',[0.05 0.1 0.05 0.5]);






end %  function
