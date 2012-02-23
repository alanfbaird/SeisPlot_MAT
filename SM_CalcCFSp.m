function [CFSp,sig_n,tau_mag] = SM_CalcCFSp(sten,pres,angfr,coh,alphaf,betaf)
%   CALCCFS   Calculates Coulomb Failure Stress
%       [CFS] = SM_CALCCFS(STEN,PRES,ANGFR,COH)
% 
%   Calculates Coulomb Failure Stress (CFS)
%   
%   Created by Alan Baird on 2012-02-05.
%   Copyright (c)  . All rights reserved.

%convert to radians
angfr=angfr*pi/180.0;

alphaf=alphaf*pi/180.0;
betaf=betaf*pi/180.0;



estress = [ -sten(1)-pres,   -sten(4),        -sten(6); ...
            -sten(4),        -sten(2)-pres,   -sten(5); ...
            -sten(6),        -sten(5),        -sten(3)-pres     ];

% Compute normal stress



N(1)=cos(betaf)*cos(alphaf);
N(2)=cos(betaf)*sin(alphaf);
N(3)=sin(betaf);



T=estress*N'; % traction vector
T_mag=sqrt(sum(T.^2));


sig_n=dot(T,N);


tau_mag=sqrt(sum(T.^2)-sig_n^2);

%B=cross(T,N); %McKenzie construction



CFSp=tau_mag-tan(angfr)*sig_n-coh;




end %  function
