function fign = SM_plot_avoavect(fname,printname)
% 	SM_PLOTAVOAVECT   Short description
% 		[FIGN] = SM_PLOTAVOAVECT(INPUT VARIABLES)
% 
% 	Long description
% 	
% 	Created by Alan Baird on 2012-02-24.
% 	Copyright (c)  . All rights reserved.




av=SM_avoa_in2(fname);

[nx,ny]=size(av);
width=1.0;
height=1.0*ny/nx
scale=800;
xpos=50;
ypos=500;

fign=figure;

set(gcf,'Position',[xpos ypos scale*width scale*height]) % Set figure format

contourf(av.amag',50,'LineStyle','none');
axis equal
axis tight
ncquiverref(av.x(1:2:end,1:2:end),av.y(1:2:end,1:2:end),av.amag(1:2:end,1:2:end).*cosd(av.beta(1:2:end,1:2:end)),av.amag(1:2:end,1:2:end).*sind(av.beta(1:2:end,1:2:end)),'',0.5,'false','b')
colorbar
set(gca,'CLim',[0 0.6])

if nargin==2
	hgexport(gcf, printname, ...
	hgexport('factorystyle'), 'Format', 'epsc');
end




end %  function

