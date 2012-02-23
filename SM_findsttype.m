function type = SM_findsttype(V,D)
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
	if vert==1; %normal
		type(ii) = 1;
	else if vert == 2; %strikeslip
		type(ii) = 0;
	else
		type(ii) = -1; %reverse
	end
end

end %  function
