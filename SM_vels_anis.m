function [VPiso,VSiso,AVP,AVSmax] = SM_vels_anis(C,rh)
% 	SM_VELS_ANIS   Short description
% 		[VP,VS,AVP,AVS] = SM_VELS_ANIS(C,RH)
% 
% 	Long description
% 	
% 	Created by Alan Baird on 2012-02-16.
% 	Copyright (c)  . All rights reserved.






      % Set up inc-az grids...
      [INC,AZ] = meshgrid([90:-6:0],[0:6:360]) ;
      
      % Invoke MS_phasevels to get wave velocities etc.
%      [~,~,vs1,vs2,vp, S1P] = MS_phasevels(C,rh,...
      [~,~,vs1,vs2,vp] = MS_phasevels(C,rh,...
        reshape(INC,61*16,1),reshape(AZ,61*16,1));
    
      % reverse so sph2cart() works properly
      AZ = -AZ;
      
      % Reshape results back to grids
%      VS1 = reshape(vs1,61,16);
%      VS2 = reshape(vs2,61,16);
%      VP =  reshape(vp,61,16);
%      VS1_x = reshape(S1P(:,1),61,16);
%      VS1_y = reshape(S1P(:,2),61,16);
%      VS1_z = reshape(S1P(:,3),61,16);
      
%  ** output average velocities
%      VPiso=mean(mean(VP)) ;
%      VSiso=mean([mean(mean(VS1)) mean(mean(VS2))]) ;
	  
      VPiso=mean(vp) ;
      VSiso=mean([mean(vs1) mean(vs2)]) ;

	  
	  VPmax=max(vp); VPmin=min(vp);
	  VPmean=(VPmax+VPmin)./2.0;
	  AVP=100.0.*(VPmax-VPmin)/VPmean ;
	  
	  dVS=(vs1-vs2);
	  VSmean=(vs1+vs2)./2.0;
	  AVS=100.0*(dVS./VSmean);
	  AVSmax=max(AVS); 
	  

  end %  function
