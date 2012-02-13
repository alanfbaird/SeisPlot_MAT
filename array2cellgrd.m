function GR = array2cellgrd(array,nx,ny,nz)
% 	ARRAYTOGRD   Short description
% 		[GR] = ARRAY2GRD(ARRAY,NX,NY,NZ)
% 
% 	Long description
% 	
% 	Created by Alan Baird on 2012-02-09.
% 	Copyright (c)  . All rights reserved.

%count=1;
%for i=1:nx
%	for j=1:ny
%		for k=1:nz
%			GR(i,j,k)=array(i);
%			count=count+1;
%		end		
%	end	
%end

total=nx*ny*nz;
%GR=cell(nx,ny,nz);

for i=1:total
    ix=1+mod(i-1,nx);
    iy=1+idivide((i-(idivide(i-1,nx*ny))*(nx*ny)-ix),nx);
    iz=1+idivide((i-1),(nx*ny));
	GR(ix,iy,iz).C=array(:,:,i);
end

end %  function
