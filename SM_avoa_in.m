function avoa=SM_avoa_in(fname)
	
	
	
	
	data=load(fname);
	nrows=max(size(data));
	
	for irow=1:nrows
		ii=data(irow,1);
		jj=data(irow,2);
		avoa(ii,jj).beta=data(irow,3);
		avoa(ii,jj).lam1=data(irow,4);
		avoa(ii,jj).lam2=data(irow,5);
		avoa(ii,jj).amag=data(irow,6);
		avoa(ii,jj).a0  =data(irow,7);
	end
	





end %  function