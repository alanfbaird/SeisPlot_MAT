function SM_salami_out(fname,Gtop,Glow)
% 	FUNCTIONNAME   Short description
% 		[] = FUNCTIONNAME(INPUT VARIABLES)
% 
% 	Long description
% 	
% 	Created by Alan Baird on 2012-02-10.
% 	Copyright (c)  . All rights reserved.

fid=fopen(fname,'w');
[nx,ny]=size(Glow);

fprintf(fid,'1 %4i // INLINE: FIRST, NUMBER\n',nx);
fprintf(fid,'1 %4i // XLINE: FIRST, NUMBER\n\n',ny);

fprintf(fid,'21 // NEC overburden\n\n');

ecprint(fid,Gtop.C,Gtop.rho);
fprintf(fid,'\n');

fprintf(fid,'21 // NEC lower layer\n\n');

for ii=1:nx
	for jj=1:ny
		fprintf(fid,'%4i %4i %f\n\n',ii,jj,Glow(ii,jj).z);
		ecprint(fid,Glow(ii,jj).C,Glow(ii,jj).rho);
		fprintf(fid,'\n');
	end
end

fclose(fid);
end %  function






function ecprint(fid,C,rho)
    for i=1:6
       for j=i:6
          fprintf(fid,'%1i %1i %e\n',i,j,C(i,j));
       end
    end   
    fprintf(fid,'%1i %1i %f\n',7,7,rho);

end %  function