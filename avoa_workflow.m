bs1=SM_import_ec_cell('valhall_mech_SR3_seismic_bs.1.out');
SM_salami_out('salami1.txt',bs1(26,26,42),bs1(:,:,36));

!salami

av=SM_avoa_in2('salami_avoa.dat');
imagesc(av.x(:,1),av.y(1,:),av.amag');
set(gca,'YDir','normal');
hold on;
ncquiverref(av.x,av.y,av.amag.*cosd(av.beta),av.amag.*sind(av.beta),'',0.1,'true');
colorbar;
set(gca,'CLim',[0 0.11])
axis equal;
axis tight;