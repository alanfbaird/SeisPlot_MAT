test = SM_Import_ec('Elastic_rotated1_mesh100to250_damping_2seismic2_seismic_bsp.3.out')

for i=1:test.total
[pol(i),avs(i),vs1(i),vs2(i),vp(i),SF(:,i),SS(:,i)]=MS_phasevels(test.C(:,:,i),test.rho(i),90,0);
end
[GX,GY,GZ,Gpol]=SM_Makegrid(test.x',test.y',test.z',avs',100);

xslice=710000; yslice=6063600; zslice=-2400;
h=SM_Plot3d(GX,GY,GZ,Gpol,xslice,yslice,zslice);





bsp=SM_Import_ec('Elastic_rotated1_mesh100to250_damping_2seismic2_seismic_bsp.3.out');


xslice=710000; yslice=6063600; zslice=-2400;



% Find isotropic Vp and Vs everywhere
for i=1:bsp.total
[Vp(i),Vs(i)]=SM_avVelocity(bsp.C(:,:,i),bsp.rho(i));
end

[GX,GY,GZ,GVp]=SM_Makegrid(bsp.x',bsp.y',bsp.z',Vp',100);
fign=SM_Plot3d_comp(GX,GY,GZ,GVp,xslice,yslice,zslice,'test1.eps');

for i=1:bsp.total
[pol(i),avs(i),vs1(i),vs2(i),vp(i),SF(:,i),SS(:,i)]=MS_phasevels(bsp.C(:,:,i),bsp.rho(i),90,0);
end

[GX,GY,GZ,GV]=SM_Makegrid(bsp.x',bsp.y',bsp.z',avs',100);
fign=SM_Plot3d_comp(GX,GY,GZ,GV,xslice,yslice,zslice,'Ch3bsp.vertSWS.eps');



for i=1:bsp.total
[VPiso(i),VSiso(i),AVP(i),AVSmax(i)] = SM_vels_anis(bsp.C(:,:,i),bsp.rho(i));
end


SM_vels_anis(C,rh)