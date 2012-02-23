bs1=SM_import_ec_cell('valhall_mech_SR3_seismic_bs.1.out');
SM_salami_out('salami_in.txt',bs1(26,26,42),bs1(:,:,36));
SM_salami_out('salami_in.txt',bs1(:,:,42),bs1(:,:,36));

!salami

av=SM_avoa_in2('salami_avoa.dat');
imagesc(av.x(:,1),av.y(1,:),av.amag');
set(gca,'YDir','normal');
hold on;
%ncquiverref(av.x,av.y,av.amag.*cosd(av.beta),av.amag.*sind(av.beta),'',0.1,'true');
ncquiverref(av.x,av.y,av.amag.*cosd(av.beta),av.amag.*sind(av.beta),'',0.1,'true','col');

ncquiverref(av.x,av.y,av.amag.*cosd(av.beta),av.amag.*sind(av.beta));
colorbar;
%set(gca,'CLim',[0 0.11])
axis equal;
axis tight;



% x       - x-coordinate or latitude
%
% y       - y-coordinate or longitude
%
% u       - u-component (Cartesian +x-direction, map +longitude-direction)
%
% v       - v-component (Cartesian +y-direction, map +latitude-direction)
%
% units   - a string providing the units of the vector field.  This assumes
%           the default Tex interpreter is being used as set 
%           elsewhere using set(0,'DefaultTextInterpreter','tex').
%
% reftype - character variable specifying the type of reference vector.
%           Allowable values are 'median' for giving a reference
%           vector based on the median, or 'max' for giving the
%           reference vector based on the maximum.  This argument may 
%           be omitted with 'max' as the default. If reftype is entered 
%           as a number, then this is the value of the reference vector 
%           in the units of the data in u and v. If veccol is set to
%           'col', this argument has no effect and should be entered
%           only as a dummy argument.
%
% refvec  - logical that turns off or on the plotting of the reference
%           vector scale for plotting vectors.  The default is 'true'.
%
% veccol  - color of the vectors to be plotted.  This may either be in the
%           form of RGB or as a single letter, such as 'b' for blue
%           using standard Matlab color specifications. This may be set
%           to 'col' if the vectors are to be color coded by magnitude
%           instead of sized by magnitude. In this case, all vectors
%           have the same size based on the optimum value for the grid
%           provided, and a colorbar is provided to reference the values.
%
% cont    - contour levels to be used if color shading the vectors.  For
%           this to work, veccol='col', and as a result all vectors
%           are made of equal length but color coded according to their
%           magnitude. The contour levels must be non-zero, and must include
%           at least one value.   The values at the divider between
%           vector color categories.
%
