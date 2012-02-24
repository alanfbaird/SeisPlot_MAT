function SM_plotstressvect(Gr)
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
	sdiff=(D(1,1)-D(3,3))*10^(-6)
	V(:,1)
	ugrid(i)=V(1,1)*sdiff;
	vgrid(i)=V(2,1)*sdiff;
end

%quiver(X,Y,ugrid,vgrid)

X=reshape(X,nx,ny);
Y=reshape(Y,nx,ny);
ugrid=reshape(ugrid,nx,ny);
vgrid=reshape(vgrid,nx,ny);



ncquiverref(X,Y,ugrid,vgrid,'',100,'true','b')
axis equal;
axis tight;


end %  function






