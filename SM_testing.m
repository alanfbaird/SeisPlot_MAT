total=60
nx=int32(4)
ny=int32(5)
nz=int32(3)

for i=1:total
    ix=1+mod(i-1,nx);
    iy=1+idivide((i-(idivide(i-1,nx*ny))*(nx*ny)-ix),nx);
    iz=1+idivide((i-1),(nx*ny));
	out(1,i)=ix;
	out(2,i)=iy;
	out(3,i)=iz;
end
