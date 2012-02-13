function avoa=SM_avoa_in2(fname)
	
	
	
	
	data=load(fname);
	nrows=max(size(data));
%	avoa.x=data(:,1);
%	avoa.y=data(:,2);
%	avoa.beta=data(:,3);
%	avoa.lam1=data(:,4);
%	avoa.lam2=data(:,5);
%	avoa.amag=data(:,6);
%	avoa.a0  =data(:,7);
	
	for irow=1:nrows
		ii=data(irow,1);
		jj=data(irow,2);
		
		avoa.x(ii,jj)=data(irow,1);
		avoa.y(ii,jj)=data(irow,2);
		avoa.beta(ii,jj)=data(irow,3);
		avoa.lam1(ii,jj)=data(irow,4);
		avoa.lam2(ii,jj)=data(irow,5);
		avoa.amag(ii,jj)=data(irow,6);
		avoa.a0(ii,jj)  =data(irow,7);
	end
	





end %  function