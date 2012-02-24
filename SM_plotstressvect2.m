function fign=SM_plotstressvect2(Gr,printname)
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

for i = 1:total
	estress= [ -list(i).STRESS(1)-list(i).PRESSURE,   -list(i).STRESS(4),        -list(i).STRESS(6); ...
        				  -list(i).STRESS(4),        -list(i).STRESS(2)-list(i).PRESSURE,   -list(i).STRESS(5); ...
           				  -list(i).STRESS(6),        -list(i).STRESS(5),        -list(i).STRESS(3)-list(i).PRESSURE     ];
	
	[V(:,:),D(:,:)] = eig(estress);
	[V(:,:),D(:,:)] =sortem(V(:,:),D(:,:));
	X(i)=list(i).x;
	Y(i)=list(i).y;
	sdiff(i)=(D(1,1)-D(3,3))*10^(-6);
	ugrid(i)=V(1,1)*sdiff(i);
	vgrid(i)=V(2,1)*sdiff(i);
end

%quiver(X,Y,ugrid,vgrid)

X=reshape(X,nx,ny);
Y=reshape(Y,nx,ny);
ugrid=reshape(ugrid,nx,ny);
vgrid=reshape(vgrid,nx,ny);
sdiff=reshape(sdiff,nx,ny);

contourf(X,Y,sdiff,50,'LineStyle','none');



ncquiverref(X(1:2:end,1:2:end),Y(1:2:end,1:2:end),ugrid(1:2:end,1:2:end),vgrid(1:2:end,1:2:end),'',100,'false','b')
axis equal;
axis tight;
colorbar


if nargin==2
	hgexport(gcf, printname, ...
	hgexport('factorystyle'), 'Format', 'epsc');
end




end %  function






