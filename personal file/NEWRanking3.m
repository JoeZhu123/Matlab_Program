%
for n=1:4
zb=[b1(:,n),b2(:,n),b3(:,n),b4(:,n)];
zr=corrcoef(zb);
[vec,val]=eig(zr);
newval=diag(val);
[y,i1]=sort(newval);
for z=1:length(y)
newy(z)=y(length(y)+1-z);
end
gxr=y/sum(y);
ngxr=newy/sum(newy);
w=ngxr';
L=zb*w;
[R1,i2(:,n)]=sort(L,'descend');
end