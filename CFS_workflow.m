v62=SM_Import_st_win('valhall_mech_SR3_seismic.62')



% Find number of grid points
[total comp]=size(v62.STRESS)


% Set angle of friction and cohesion
angfr=35.0;
cohesion=0.0;


% calculate CFS at each grid point
for ii=1:total
	CFS(ii)=SM_CalcCFS(v62.STRESS(ii,:),v62.PRESSURE(ii),angfr,cohesion);
end

% Make grids suitable for plotting, with 40 metre spacing
%  												VVVVVVVVVVVV
%  												VVVVVVVVVVVV
%  			CHANGE GRID SPACING					VVVVVVVVVVVV
%  												VVVVVVVVVVVV
%  												VVVVVVVVVVVV
[GX,GY,GZ,GCFS]=SM_Makegrid(v62.x,v62.y,v62.z,CFS',40);

% set slices for plotting
xslice=526000; yslice=6236000; zslice=-2400;

% Make 3d plot
h=SM_Plot3d(GX,GY,GZ,Gpol,xslice,yslice,zslice);







