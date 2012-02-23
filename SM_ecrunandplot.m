
%	before you call set fname and savename,xslice,yslice,zslice

test = SM_Import_ec(fname);


%xslice=710000; yslice=6063600; zslice=-2400;

% For vertical velocities and sws
for i=1:test.total
	[pol(i),avs(i),~,~,vp(i),SF(:,i),SS(:,i)]=MS_phasevels(test.C(:,:,i),test.rho(i),90,0);
end
[GX,GY,GZ,GV]=SM_Makegrid(test.x',test.y',test.z',avs',100);
fign=SM_Plot3d_comp2(GX,GY,GZ,GV,xslice,yslice,zslice,[savename '.vertSWS.eps']);
[GX,GY,GZ,GV]=SM_Makegrid(test.x',test.y',test.z',vp',100);
fign=SM_Plot3d_comp2(GX,GY,GZ,GV,xslice,yslice,zslice,[savename '.vertVP.eps']);
clear avs vp GX GY GZ GV;


% Find isotropic Vp and Vs everywhere
for i=1:test.total
[Vp(i),Vs(i)]=SM_avVelocity(test.C(:,:,i),test.rho(i));
end
[GX,GY,GZ,GV]=SM_Makegrid(test.x',test.y',test.z',Vp',100);
fign=SM_Plot3d_comp2(GX,GY,GZ,GV,xslice,yslice,zslice,[savename '.isoVP.eps']);
[GX,GY,GZ,GV]=SM_Makegrid(test.x',test.y',test.z',Vs',100);
fign=SM_Plot3d_comp2(GX,GY,GZ,GV,xslice,yslice,zslice,[savename '.isoVS.eps']);
clear Vp Vs GX GY GZ GV;



%% Find isotropic Thomsen Parameters
%for i=1:test.total
%[eps(i),gam(i),del(i)]=MS_Thomsen(test.C(:,:,i));
%end
%[GX,GY,GZ,GV]=SM_Makegrid(test.x',test.y',test.z',eps',100);
%fign=SM_Plot3d_comp2(GX,GY,GZ,GV,xslice,yslice,zslice,[savename '.eps.eps']);
%[GX,GY,GZ,GV]=SM_Makegrid(test.x',test.y',test.z',gam',100);
%fign=SM_Plot3d_comp2(GX,GY,GZ,GV,xslice,yslice,zslice,[savename '.gam.eps']);
%[GX,GY,GZ,GV]=SM_Makegrid(test.x',test.y',test.z',del',100);
%fign=SM_Plot3d_comp2(GX,GY,GZ,GV,xslice,yslice,zslice,[savename '.del.eps']);
%clear eps gam del GX GY GZ GV;
%
%






















%
%
%test = SM_import_ec('Elastic_rotated1_mesh100to250_damping_2seismic2_seismic_bsp.3.out')
%
%for i=1:test.total
%[pol(i),avs(i),vs1(i),vs2(i),vp(i),SF(:,i),SS(:,i)]=MS_phasevels(test.C(:,:,i),test.rho(i),90,0);
%end
%[GX,GY,GZ,Gpol]=SM_Makegrid(test.x',test.y',test.z',avs',100);
%
%xslice=710000; yslice=6063600; zslice=-2400;
%h=SM_Plot3d(GX,GY,GZ,Gpol,xslice,yslice,zslice);
%
%
%
%
%
%bsp=SM_Import_ec('Elastic_rotated1_mesh100to250_damping_2seismic2_seismic_bsp.3.out');
%
%
%xslice=710000; yslice=6063600; zslice=-2400;
%
%
%
%% Find isotropic Vp and Vs everywhere
%for i=1:bsp.total
%[Vp(i),Vs(i)]=SM_avVelocity(bsp.C(:,:,i),bsp.rho(i));
%end
%
%[GX,GY,GZ,GVp]=SM_Makegrid(bsp.x',bsp.y',bsp.z',Vp',100);
%fign=SM_Plot3d_comp(GX,GY,GZ,GVp,xslice,yslice,zslice,'test1.eps');
%
%for i=1:bsp.total
%[pol(i),avs(i),vs1(i),vs2(i),vp(i),SF(:,i),SS(:,i)]=MS_phasevels(bsp.C(:,:,i),bsp.rho(i),90,0);
%end
%
%[GX,GY,GZ,GV]=SM_Makegrid(bsp.x',bsp.y',bsp.z',avs',100);
%fign=SM_Plot3d_comp(GX,GY,GZ,GV,xslice,yslice,zslice,'Ch3bsp.vertSWS.eps');
%
%
%
%for i=1:bsp.total
%[VPiso(i),VSiso(i),AVP(i),AVSmax(i)] = SM_vels_anis(bsp.C(:,:,i),bsp.rho(i));
%end
%
%
%SM_vels_anis(C,rh)
%