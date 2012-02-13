function h = tmpgrdplot(GID,n)
% 	TMPGRDPLOT   Short description
% 		[H] = TMPGRDPLOT(INPUT VARIABLES)
% 
% 	Long description
% 	
% 	Created by Alan Baird on 2012-02-09.
% 	Copyright (c)  . All rights reserved.

pcolor(squeeze(GID(:,n,:))');
hold on;

y1=42;
y2=36;

line([1;51],[y1;y1],'LineWidth',4,'Color','y');
line([1;51],[y2;y2],'LineWidth',4,'Color','y')
hold off

end %  function