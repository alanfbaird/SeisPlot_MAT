function fign=SM_SWSticks(Gr,printname)
% 	FUNCTIONNAME   Short description
% 		[H] = FUNCTIONNAME(INPUT VARIABLES)
% 
% 	Long description
% 	
% 	Created by Alan Baird on 2012-02-23.
% 	Copyright (c)  . All rights reserved.





[nx,ny]=size(Gr);
total=nx*ny;
list=reshape(Gr,1,total)


width=1.0;
height=1.0*ny/nx
scale=800;
xpos=50;
ypos=500;

fign=figure;

set(gcf,'Position',[xpos ypos scale*width scale*height]) % Set figure format




%X = zeros(total) ;
%Y = zeros(total) ;
%ugrid = zeros(total) ;
%vgrid = zeros(total) ;

for i=1:total
	[~,avs(i),~,~,~,SF]=MS_phasevels(list(i).C,list(i).rho,90,0);
	X(i)=list(i).x;
	Y(i)=list(i).y;
	ugrid(i)=SF(1)*avs(i);
	vgrid(i)=SF(2)*avs(i);
end


X=reshape(X,nx,ny);
Y=reshape(Y,nx,ny);
ugrid=reshape(ugrid,nx,ny);
vgrid=reshape(vgrid,nx,ny);
avs=reshape(avs,nx,ny);

contourf(X,Y,avs,50,'LineStyle','none');



ncquiverref(X(1:2:end,1:2:end),Y(1:2:end,1:2:end),ugrid(1:2:end,1:2:end),vgrid(1:2:end,1:2:end),'',5,'false','b')
axis equal;
axis tight;
colorbar


if nargin==2
	hgexport(gcf, printname, ...
	hgexport('factorystyle'), 'Format', 'epsc');
end




end %  function






