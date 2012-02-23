function DHSR = SM_findDHSR(V,D)
% 	SM_FINDDHSR   Short description
% 		[DHSR] = SM_FINDDHSR(V,D)
% 
% 	Long description
% 	
% 	Created by Alan Baird on 2012-02-14.
% 	Copyright (c)  . All rights reserved.

num = size(V,3) ;

for ii=1:num
	vert=find(abs(V(3,:,ii))==max(abs(V(3,:,ii))));
	H=D(:,:,ii);
	H(vert,:)=[];
	H(:,vert)=[];
	Hmax=max(H(1,1),H(2,2));
	Hmin=min(H(1,1),H(2,2));
	DHSR(ii)=(Hmax-Hmin)/Hmax;
end

end %  function




