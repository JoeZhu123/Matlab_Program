clear
clc
tic
%符号定义
%重物下降的高度h
%小车行驶的路程s
%内部能耗系数ypxl
n=10000;
h=0.5;
nn=1000;
ypxl=linspace(0.5,1,n);
R2=111/nn;
R1=35/nn;
m=1;
g=9.8;
mz=2;
 
sgm=0.5/nn;
for i=1:10
   % sgm=(0.1*i+0.2)/nn;
 %mz=1.75-0.2+0.2*i;
R1=R1+20/nn;
R2=R2+20/nn;
s=ypxl*m*h/(mz*(1/R1+2/R2)*sgm);
s=s/1.045615886000699;
plot(ypxl,s);
hold on
grid on
end
plot(0.5,0);
toc