function [Vp,Vs] = SM_avVelocity(C,rh)
% 	SM_AVVELOCITY   Short description
% 		[VP,VS] = SM_AVVELOCITY(C,RH)
% 
% 	Long description
% 	
% 	Created by Alan Baird on 2012-02-15.
% 	Copyright (c)  . All rights reserved.

CR = MS_axes(C, 'nowarn') ;
[Ciso] = MS_decomp(CR) ;

Vp=1e-3.*sqrt((Ciso(3,3)*1e9)./rh);
Vs=1e-3.*sqrt((Ciso(4,4)*1e9)./rh);

end %  function