function [top,bot] = SM_array_top_bot(gr,ind)
% 	SM_ARRAY_TOP_BOT   Short description
% 		[TOP,BOT] = SM_ARRAY_TOP_BOT(GR,IND)
% 
% 	Long description
% 	
% 	Created by Alan Baird on 2012-02-20.
% 	Copyright (c)  . All rights reserved.

[nx,ny]=size(ind);

if size(gr(:,:,1))~=size(ind)
	error('grid demensions do not match')	
end

top = struct(gr(:,:,1));
bot = struct(gr(:,:,1));

for ix=1:nx
	for iy=1:ny
		if ind(ix,iy)==0
			error('no interface')
			top(ix,iy)=gr(ix,iy,1);
			bot(ix,iy)=gr(ix,iy,1);
		else
			top(ix,iy)=gr(ix,iy,ind(ix,iy)+1);
			bot(ix,iy)=gr(ix,iy,ind(ix,iy));
		end
		
		
	end
	
end


end %  function