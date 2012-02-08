function C = calc_ec_matrix(ecdata,varargin) ;
% 	CALC_EC_MATRIX   
% 		[C] = CALC_EC_MATRIX(ECDATA)
% 
% 	Converts series of n elastic tensors from a 21*N component matrix
%	to a 6*6*N component array for using in MSAT anisotropy routines.
%	

%	Adapted from MS_LOAD_LIST
% Copyright (c) 2011, James Wookey and Andrew Walker
% All rights reserved.
% 	
% 	adapted by Alan Baird on 2012-02-07.

eunit = 'default' ;

%  ** process the optional arguments
iarg = 1 ;
while iarg <= (length(varargin))
   switch lower(varargin{iarg})
      case 'eunit'
         eunit = varargin{iarg+1} ;
         iarg = iarg + 2 ;
         eunit_set = 1 ;
      otherwise 
         error(['Unknown option: ' varargin{iarg}]) ;   
   end   
end 






[n nec] = size(ecdata) ;



if nec~=21
   error('Only 21 elastic constants allowed') ;
end

C = zeros(6,6,n) ;

for irow = 1:n
   ipos = 0 ;
   for i=1:6 ;
      for j=i:6 ;
         ipos = ipos + 1 ;
         C(i,j,irow) = ecdata(irow,ipos) ;
         if (i ~= j) ; % Populate the lower half of the matrix.
             C(j, i, irow) = C(i, j, irow);
         end
      end
   end 
end

%  ** perform unit conversions
      switch lower(eunit)
      case 'gpa'
      case 'pa'
         C = C ./ 1e9 ;
      case 'mbar'
         C = C .* 100 ;
      case 'bar'
         C = C ./ 10e3 ;
      otherwise
         error('MS:LOAD:BadEunit','Unsupported elasticity unit.')
      end


end %  function