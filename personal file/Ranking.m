x1=xlsread('2014.xlsx','G3:G22');
x2=xlsread('2014.xlsx','H3:H22');
x3=xlsread('2014.xlsx','O3:O22');
x4=xlsread('2014.xlsx','P3:P22');
x5=xlsread('2014.xlsx','R3:R22');
zb1=bzgc(x1);
zb2=bzgc(x2);
zb3=bzgc(x3);
zb4=bzgc(x4);
zb5=bzgc(x5);
zb=[zb1,zb2,zb3,zb4,zb5];
zr=corrcoef(zb);
[vec,val]=eig(zr);
newval=diag(val);
[y,i]=sort(newval);
for z=1:length(y)
newy(z)=y(length(y)+1-z);
end
gxr=y/sum(y);
ngxr=newy/sum(newy);
sumgxr=0;
newi=[];
for k=length(y):-1:1
sumgxr=sumgxr+gxr(k);
newi(length(y)+1-k)=i(k);
if sumgxr>0.85 break;
end
end
zs=length(newi);
w=ngxr';
R=zb*w;
[R1,i]=sort(R,'descend');
