
%	before you call set fname and savename,xslice,yslice,zslice





%test=SM_Import_st_win(fname)
test=SM_Import_st(fname)

%% Set angle of friction and cohesion
%angfr=35.0;
%cohesion=0.0;

%Set dominant frac orientation
betaf=0.0
alphaf=90.0



% For CFS and Sdiff
for i=1:test.total
	[CFS(i), Sdiff(i), smax(i), smin(i)] = SM_Calcstress(test.STRESS(i,:),test.PRESSURE(i),angfr,cohesion);
end
[GX,GY,GZ,GV]=SM_Makegrid(test.x,test.y,test.z,CFS',100);
fign=SM_Plot3d_comp2(GX,GY,GZ,GV,xslice,yslice,zslice,[savename '.CFS.eps']);
[GX,GY,GZ,GV]=SM_Makegrid(test.x,test.y,test.z,Sdiff',100);
fign=SM_Plot3d_comp2(GX,GY,GZ,GV,xslice,yslice,zslice,[savename '.Sdiff.eps']);
clear CFS Sdiff GX GY GZ GV;



% For planar CFS and 
for i=1:test.total
	[CFSp(i),sig_n(i),tau_mag(i)] = SM_CalcCFSp(test.STRESS(i,:),test.PRESSURE(i),angfr,cohesion,alphaf,betaf);
end
[GX,GY,GZ,GV]=SM_Makegrid(test.x,test.y,test.z,CFSp',100);
fign=SM_Plot3d_comp2(GX,GY,GZ,GV,xslice,yslice,zslice,[savename '.CFSp.eps']);
[GX,GY,GZ,GV]=SM_Makegrid(test.x,test.y,test.z,sig_n',100);
fign=SM_Plot3d_comp2(GX,GY,GZ,GV,xslice,yslice,zslice,[savename '.sig_np.eps']);
[GX,GY,GZ,GV]=SM_Makegrid(test.x,test.y,test.z,tau_mag',100);
fign=SM_Plot3d_comp2(GX,GY,GZ,GV,xslice,yslice,zslice,[savename '.tau_magp.eps']);

clear CFSp sig_n tau_mag GX GY GZ GV;
