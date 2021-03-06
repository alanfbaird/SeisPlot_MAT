function [gr] = SM_import_ec(filename)
% 	SM_IMPORTEC   
% 		[GR] = SM_IMPORT_EC(FILENAME)
% 
% 	Imports dynamic elasticity data from seismodel output
% 	
% 	Created by Alan Baird on 2012-02-08.
% 	Copyright (c)  . All rights reserved.

fid = fopen(filename,'r');


header=textscan(fid,'%d%d%d%d',1);
gr.total=header{1};
gr.nx=header{2};
gr.ny=header{3};
gr.nz=header{4};
header=textscan(fid,'%f%f%f%f%f%f',1);
xmin=header{1}; xmax=header{2}; ymin=header{3}; ymax=header{4}; zmin=header{5}; zmax=header{6};
header=textscan(fid,'%d%d',1);
nsurf=header{1}; nsgrid=header{2};

for i=1:nsurf
    junk=textscan(fid, '%f',nsgrid);
    %currentLine = fgetl(fid);
end

intmp=textscan(fid,'%f%f%f%d%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f',gr.total);

%
gr.x=intmp{1}';
gr.y=intmp{2}';
gr.z=intmp{3}';
gr.ec=cell2mat(intmp(5:25))';
gr.rho=intmp{26}';

gr.C=SM_calc_ec_matrix_alt(gr.ec,'eunit','pa');

end %  function
