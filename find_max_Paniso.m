function [aVp,vpmax,vpmin,aSmax] = find_max_Paniso(C,r)

%   r = 3000; % dummy density 

   az_init = 32.7;
   inc_init = 25.776;

   options = optimset('TolX',1.0,'TolFun',100,'PlotFcns',@optimplotfunccount);
   
%   options = optimset('PlotFcns',@optimplotfval);

   [out, fval, ~, output] = fminsearch(@get_Pmax, [inc_init,az_init], options);
%   output.iterations;                                    
%   output.message;                                       
   azmax = out(2);                                        
   incmax = out(1);
   vpmax=-1.0*fval; 
                                        
   [out, fval, ~, output] = fminsearch(@get_Pmin, [inc_init,az_init], options);
%   output.iterations;
   azmin = out(2);
   incmin = out(1);
   vpmin=fval;
%   [ ~, ~, ~, ~, vpmax] = MS_phasevels(C, r, incmax, azmax);
%   [ ~, ~, ~, ~, vpmin] = MS_phasevels(C, r, incmin, azmin);
   aVp = 100.0*(vpmax - vpmin) / ((vpmax+vpmin)*0.5);
   
   [out, fval, ~, output] = fminsearch(@get_aSmax, [inc_init,az_init], options);
   aSmax=-1.0*fval;

   function [pmax] = get_Pmax(in)
        azin = in(2);
        incin = in(1);
       [ ~, ~, ~, ~, vp] = MS_phasevels(C, r, incin, azin);
       pmax = vp*-1.0;
   end

   function [pmin] = get_Pmin(in)
        azin = in(2);
        incin = in(1);
       [ ~, ~, ~, ~, vp] = MS_phasevels(C, r, incin, azin);
       pmin = vp;
   end
   
   function [aSmax] = get_aSmax(in)
	   azin = in(2);
	   incin = in(1);
	   [~,~,vs1,vs2,~] = MS_phasevels(C, r, incin, azin);
	   aSmax = -1.0*100.0*((vs1-vs2)/((vs1+vs2)/2.0));
   
   
   
   end

end 
