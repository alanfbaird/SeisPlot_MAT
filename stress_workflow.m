v62=SM_Import_st_win('valhall_mech_SR3_seismic.62')



% Find number of grid points
[total comp]=size(v62.STRESS)


% Set angle of friction and cohesion
angfr=35.0;
cohesion=0.0;


% calculate CFS at each grid point
for ii=1:total
	[CFS(ii), Sdiff(ii)] = SM_Calcstress(test.STRESS(ii,:),test.PRESSURE(ii),angfr,cohesion)
end


[GX,GY,GZ,GCFS]=SM_Makegrid(v62.x,v62.y,v62.z,CFS',40);

xslice=526000; yslice=6236000; zslice=-2400;

h=SM_Plot3d(GX,GY,GZ,Gpol,xslice,yslice,zslice);





ch2=SM_Import_st_win('Elastic_rotated1_mesh100to250_damping_2seismic2_seismic.3');
[estress,V,D]=SM_Calcstresstens(ch2.STRESS,ch2.PRESSURE);



find(abs(V(3,:,7000))==max(abs(V(3,:,7000))));
finds the index of the largest vertical component principal stress




