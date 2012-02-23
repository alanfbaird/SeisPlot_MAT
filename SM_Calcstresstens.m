function [estress,V,D] = SM_Calcstresstens(sten,pres)
%   SM_CALCCFS   Calculates Coulomb Failure Stress
%       [OUT] = SM_CALCSTRESS(STEN,PRES,ANGFR,COH)
% 
%   Calculates Coulomb Failure Stress (CFS)
%   
%   Created by Alan Baird on 2012-02-05.
%   Copyright (c)  . All rights reserved.

%convert to radians
%angfr=angfr*pi/180.0;


[n nst] = size(sten) ;



if nst~=6
   error('Only 6 stress components allowed') ;
end

estress = zeros(3,3,n) ;

for irow = 1:n
	estress(:,:,irow) = [ -sten(irow,1)-pres(irow),   -sten(irow,4),        -sten(irow,6); ...
        				  -sten(irow,4),        -sten(irow,2)-pres(irow),   -sten(irow,5); ...
           				  -sten(irow,6),        -sten(irow,5),        -sten(irow,3)-pres(irow)     ];
	
	[V(:,:,irow),D(:,:,irow)] = eig(estress(:,:,irow));
	[V(:,:,irow),D(:,:,irow)] =sortem(V(:,:,irow),D(:,:,irow));
	
end

%
%
%eval=eig(estress);
%
%smax=max(eval);
%smin=min(eval);
%
%
%q=(smax-smin)/2.0;     % max shear stress
%p=(smax+smin)/2.0;     % mean effective stress
%OUT(1)=q-coh*cos(angfr)-p*sin(angfr);
%
%OUT(2)=smax-smin;







end %  function
