function [HhV,HhVvec] = SM_HhV(V,D)
% 	SM_FINDDHSR   Short description
% 		[DHSR] = SM_FINDDHSR(V,D)
% 
% 	Takes sorted eigenvalue eigen vectors
%	and resorts them to SHmax,SHmin, and SV
% 	
% 	Created by Alan Baird on 2012-02-14.
% 	Copyright (c)  . All rights reserved.

num = size(V,3) ;

for ii=1:num
	vert=find(abs(V(3,:,ii))==max(abs(V(3,:,ii))));
	HhV(3,ii)=D(vert,vert,ii);
	HhVvec(:,3,ii)=V(:,vert,ii);
	if vert==1
		h1=2; h2=3;
	else if vert==2
		h1=1;h2=3;
	else
		h1=1;h2=2;
	end
	HhV(1,ii)=D(h1,h1,ii);
	HhV(2,ii)=D(h2,h2,ii);
	HhVvec(:,1,ii)=V(:,h1,ii);
	HhVvec(:,2,ii)=V(:,h2,ii);
end

end %  function
