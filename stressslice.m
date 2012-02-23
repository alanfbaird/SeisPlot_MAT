function [tmpx,tmpy,tmpestress,tmpD,tmpV] = stressslice(x,y,z,depth,estress,D,V)
% 	FUNCTIONNAME   Short description
% 		[OTMPX,TMPY,TMPESTRESS,TMPD,TMPVS= FUNCTIONNAME(INPUT VARIABLES)
% 
% 	Long description
% 	
% 	Created by Alan Baird on 2012-02-14.
% 	Copyright (c)  . All rights reserved.

total=length(x);

count=0;
for i=1:total
	if round(z(i))==depth
		count=count+1;
		tmpx(count)=x(i);
		tmpy(count)=y(i);
		tmpestress(:,:,count)=estress(:,:,i);
		tmpD(:,:,count)=D(:,:,i);
		tmpV(:,:,count)=V(:,:,i);
	end	
end


end %  function






