function gr = SM_Import_st(filename)
% 	SM_IMPORTGEOM   Short description
% 		[GR] = SM_IMPORTSTRESS(FNAME)
% 
% 	Imports data from Elfen seismic output files
% 	
% 	Created by Alan Baird on 2012-02-08.
% 	Copyright (c)  . All rights reserved.


fid = fopen(filename,'r');

eof=0

% Search for X coordinates
foundX = false;
while ~foundX
	currentLine = fgetl(fid);
	%check for eof, then 
	if currentLine == -1
		eof = true;
	elseif ~isempty(regexp(currentLine,'^\s+X Coordinate','match','once'))
		foundX = true
	end
end % looking for X coords

% find number of gridpoints with X coords
totalx = regexp(currentLine,'{\s+(?<total>\d+)\s+}','names');
totalx=str2num(totalx.total);
data=textscan(fid,'%f',totalx);
gr.x=data{1};


% Search for Y coordinates
foundY = false;
while ~foundY
	currentLine = fgetl(fid);
	%check for eof, then 
	if currentLine == -1
		eof = true;
	elseif ~isempty(regexp(currentLine,'^\s+Y Coordinate','match','once'))
		foundY = true
	end
end % looking for Y coords

% find number of gridpoints with Y coords
totaly = regexp(currentLine,'{\s+(?<total>\d+)\s+}','names');
totaly=str2num(totaly.total);
data=textscan(fid,'%f',totaly);
gr.y=data{1};

% Search for Z coordinates
foundZ = false;
while ~foundZ
	currentLine = fgetl(fid);
	%check for eof, then 
	if currentLine == -1
		eof = true;
	elseif ~isempty(regexp(currentLine,'^\s+Z Coordinate','match','once'))
		foundZ = true
	end
end % looking for Y coords

% find number of gridpoints with Y coords
totalz = regexp(currentLine,'{\s+(?<total>\d+)\s+}','names');
totalz=str2num(totalz.total);
data=textscan(fid,'%f',totalz);
gr.z=data{1};



% Found x, y, z coords, now find remaining attributes

while ~eof
	%Look for next attribute name
	foundatt = false;
	while ~foundatt
		currentLine = fgetl(fid);
		%check for eof, then 
		if currentLine == -1
			eof = true;
			foundatt = true;
			break
		elseif ~isempty(regexp(currentLine,'"[A-Za-z_]+"','match','once'))
			foundatt = true
		end
	end % looking for attributes
	if eof == true
		break
	end

	att=regexp(currentLine,'"(?<name>[A-Za-z_]+)"','names');
	att=att.name
	% Look for attribute values
	foundval = false;
	while ~foundval
		currentLine = fgetl(fid);
		%check for eof, then 
		if currentLine == -1
			eof = true;
		elseif ~isempty(regexp(currentLine,'^\s+Values','match','once'))
			foundval = true
		end
	end % looking for values

	attnum=regexp(currentLine, '{\s+(?<val>\d+)\s+}','names');
	if length(attnum)==1 % Scalar
		attnum=str2num(attnum.val);
		data=textscan(fid,'%f',attnum);
		gr.(att)=data{1};
	elseif length(attnum)==3 % tensor
		compnum=str2num(attnum(2).val);
		total=str2num(attnum(3).val);
		if compnum == 21
			data=textscan(fid,'%f%f%f%f%f%f\n%f%f%f%f%f%f\n%f%f%f%f%f%f\n%f%f%f',total);
			gr.(att)=cell2mat(data);
		elseif compnum == 6
			data=textscan(fid,'%f %f %f %f %f %f',total);
			gr.(att)=cell2mat(data);
		end
	else
		break
	end
end


end %  function


	
	
%if false
%%	xlin=linspace(min(gr.x),max(gr.x),50);
%%	ylin=linspace(min(gr.y),max(gr.y),50);
%%	zlin=linspace(min(gr.z),max(gr.z),50);
%%	[X,Y,Z]=meshgrid(xlin,ylin,zlin);
%%	C=griddata3(gr.x,gr.y,gr.z,gr.D_SOLID,X,Y,Z);
%%	slice(C,290000,6080000,-2000);
%%	slice(C,25,25,25);	
%%
%    xlin=min(gr.x):100:max(gr.x);
%    ylin=min(gr.y):100:max(gr.y);
%    zlin=min(gr.z):100:max(gr.z);
%    [X,Y,Z]=meshgrid(xlin,ylin,zlin);
%    F=TriScatteredInterp(gr.x,gr.y,gr.z,gr.PRESSURE);
%    C=F(X,Y,Z);
%    xslice=710000; yslice=6055000; zslice=-2000;
%    slice(X,Y,Z,C,xslice,yslice,zslice);
%    view(3);
%    axis on;
%    grid on;
%    light;
%    lighting phong;
%    camlight('left');
%    shading interp;
%    axis tight;
%    axis equal;
%
%
%end
%	
%if false
%
%for i=1:total
%gr.CFS(i)=calcCFS(gr.STRESS(i,:),gr.PRESSURE(i,:),35.00,0.0);
%end	
%gr.CFS=gr.CFS';
%
%
%end


%end %  function
