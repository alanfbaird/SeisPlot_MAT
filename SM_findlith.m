function Lith = SM_findlith(filename)
% 	SM_FINDLITH   Short description
% 		[LITH] = SM_FINDLITH(FILENAME)
% 
% 	Long description
% 	
% 	Created by Alan Baird on 2012-02-17.
% 	Copyright (c)  . All rights reserved.


fid = fopen(filename,'r');

eof=0



% Search for number of cells
foundNUM = false;
while ~foundNUM
	currentLine = fgetl(fid);
	%check for eof, then 
	if currentLine == -1
		eof = true;
	elseif ~isempty(regexp(currentLine,'^\s+Number_of_cells','match','once'))
		foundNUM = true
	end
end % looking for number of cells

% find number of gridpoints with X coords
data=textscan(fid,'%f%f%f',1);
nx=data{1}+1
ny=data{2}+1
nz=data{3}+1

Lith.nx=nx;
Lith.ny=ny;
Lith.nz=nz;



% Search for Lithology
foundL = false;
while ~foundL
	currentLine = fgetl(fid);
	%check for eof, then 
	if currentLine == -1
		eof = true;
	elseif ~isempty(regexp(currentLine,'^\s+Lithology_definition','match','once'))
		foundL = true
	end
end % looking for X coords

% find number of gridpoints with X coords
totalL = regexp(currentLine,'{\s+(?<total>\d+)\s+}','names');
totalL=str2num(totalL.total);
data=textscan(fid,'%f',totalL);
Lith.tag=data{1};

fclose(fid);

end %  function

