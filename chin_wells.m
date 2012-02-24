wellDir = '/Users/alanbaird/Documents/MATLAB/SeisPlot_MAT/temp/';


xori=704729.0
yori=6047520.0
angle=-56.2  % 56 degree clockwise rotation
angle=angle*pi/180;
rotmat=[cos(angle),-sin(angle); ...
		sin(angle),cos(angle)];
		




%figure(26);
hold on
list= dir([wellDir '/*.dev']);
for i=1:length(list)
    ss = dlmread([wellDir list(i).name], '',12,0);
	xtmp=ss(:,2)-xori; ytmp=ss(:,3)-yori; ztmp=ss(:,4);
	%rotate (x,y)
	xrot=xtmp.*cos(angle)-ytmp.*sin(angle);
	yrot=xtmp.*sin(angle)+ytmp.*cos(angle);
    %plot3(ss(:,2),ss(:,3),ss(:,4),'LineWidth',2);
	plot3(xrot+xori,yrot+yori,ztmp,'-r','LineWidth',2);
end

hold off
