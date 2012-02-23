%function [AVP,AVSmax] = SM_vels_anis2opt(C,rh)
function AVP = SM_vels_anis2opt(C,rh)

	total=size(rh');
	AVP=zeros(1,total);
	
%    az_init = 32.7;
%    inc_init = 25.776;
	
	
	for i=1:total
		AVP(i) = find_max_Paniso(C(:,:,i),rh(i));
		i
	end




function [aVp] = find_max_Paniso(C,r)

%   r = 3000; % dummy density 

   az_init = 32.7;
   inc_init = 25.776;

   options = optimset('TolX',1.0,'TolFun',100);

   [out, ~, ~, output] = fminsearch(@get_Pmax, [az_init, inc_init], options);
%   output.iterations;
%   output.message;
   azmax = out(1);
   incmax = out(2);
   [out, ~, ~, output] = fminsearch(@get_Pmin, [az_init, inc_init], options);
%   output.iterations;
   azmin = out(1);
   incmin = out(2);
   [ ~, ~, ~, ~, vpmax] = MS_phasevels(C, r, azmax, incmax);
   [ ~, ~, ~, ~, vpmin] = MS_phasevels(C, r, azmin, incmin);
   aVp = (vpmax - vpmin) / ((vpmax+vpmin)*0.5);

   function [pmax] = get_Pmax(in)
        azin = in(1);
        incin = in(2);
       [ ~, ~, ~, ~, vp] = MS_phasevels(C, r, azin, incin);
       pmax = vp*-1.0;
   end

   function [pmin] = get_Pmin(in)
        azin = in(1);
        incin = in(2);
       [ ~, ~, ~, ~, vp] = MS_phasevels(C, r, azin, incin);
       pmin = vp;
   end

end 

end