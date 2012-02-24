

[nx,ny,nz]=size(TY)


%pattern=[3 2]
pattern=[2 4]

out=NaN(nx,ny);

for ix=1:nx
	for iy=1:ny
		tmp=strfind(squeeze([TY(ix,iy,:)])',pattern);
		if size(tmp)>0
			out(ix,iy)=tmp;			
		end
	end
end