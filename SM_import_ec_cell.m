function [gr] = SM_import_ec_cell(filename)
% 	SM_IMPORTEC   
% 		[GR] = SM_IMPORT_EC(FILENAME)
% 
% 	Imports dynamic elasticity data from seismodel output
% 	
% 	Created by Alan Baird on 2012-02-08.
% 	Copyright (c)  . All rights reserved.

fid = fopen(filename,'r');


header=textscan(fid,'%d%d%d%d',1);
total=header{1};
nx=header{2};
ny=header{3};
nz=header{4};
header=textscan(fid,'%f%f%f%f%f%f',1);
xmin=header{1}; xmax=header{2}; ymin=header{3}; ymax=header{4}; zmin=header{5}; zmax=header{6};
header=textscan(fid,'%d%d',1);
nsurf=header{1}; nsgrid=header{2};



for i=1:nsurf
    junk=textscan(fid, '%f',nsgrid);
    %currentLine = fgetl(fid);
end

intmp=textscan(fid,'%f%f%f%d%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f',total);

%
x=intmp{1}';
y=intmp{2}';
z=intmp{3}';
ec=cell2mat(intmp(5:25))';
rho=intmp{26}';

C=SM_calc_ec_matrix_alt(ec,'eunit','pa');

%total=nx*ny*nz;
%GR=cell(nx,ny,nz);

for i=1:total
    ix=1+mod(i-1,nx);
    iy=1+idivide((i-(idivide(i-1,nx*ny))*(nx*ny)-ix),nx);
    iz=1+idivide((i-1),(nx*ny));
	gr(ix,iy,iz).x=x(i);
	gr(ix,iy,iz).y=y(i);
	gr(ix,iy,iz).z=z(i);
	gr(ix,iy,iz).rho=rho(i);
	gr(ix,iy,iz).C=C(:,:,i);
end




end %  function
