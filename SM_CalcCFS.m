function CFS = SM_CalcCFS(sten,pres,angfr,coh)
%   CALCCFS   Calculates Coulomb Failure Stress
%       [CFS] = SM_CALCCFS(STEN,PRES,ANGFR,COH)
% 
%   Calculates Coulomb Failure Stress (CFS)
%   
%   Created by Alan Baird on 2012-02-05.
%   Copyright (c)  . All rights reserved.

%convert to radians
angfr=angfr*pi/180.0;


estress = [ -sten(1)-pres,   -sten(4),        -sten(6); ...
            -sten(4),        -sten(2)-pres,   -sten(5); ...
            -sten(6),        -sten(5),        -sten(3)-pres     ];

eval=eig(estress);

smax=max(eval);
smin=min(eval);


q=(smax-smin)/2.0;     % max shear stress
p=(smax+smin)/2.0;     % mean effective stress
CFS=q-coh*cos(angfr)-p*sin(angfr);




end %  function