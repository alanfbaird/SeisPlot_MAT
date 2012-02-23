function fign=SM_Plot3d_comp2(GX,GY,GZ,GV,xslice,yslice,zslice,printname)
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

xlen=GX(1,end,1)-GX(1,1,1)
ylen=GY(end,1,1)-GY(1,1,1)
zlen=GZ(1,1,end)-GZ(1,1,1)

%[ylen,xlen,zlen]=size(GX);


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

hAx(1) = subplot('Position',[0.1 (0.1+zzy+0.1) xyx yzy]); h = slice(GX,GY,GZ,GV,xslice,yslice,zslice); view(0,90)
hAx(2) = subplot('Position',[0.1 0.1 xyx zzy]); copyobj(h,hAx(2)); view(0,0)
hAx(3) = subplot('Position',[(0.1+xyx+0.1) 0.1 yyx zzy]); copyobj(h,hAx(3)); view(90,0) 
hAx(4) = subplot('Position',[(0.1+xyx+0.1) (0.1+zzy+0.1) yyx yzy]); copyobj(h,hAx(4)); view([37.5 25]);
colorbar('location','southoutside')
CLim1 = get(hAx(4),'CLim')




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
	set(hAx(i),'CLim',CLim1)
end

light;
lighting phong;
camlight('left');
shading interp;



if nargin==8
	hgexport(gcf, printname, ...
	hgexport('factorystyle'), 'Format', 'epsc');
end



end %  function
