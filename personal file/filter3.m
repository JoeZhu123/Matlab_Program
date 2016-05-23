clear all;
close all;
a1=xlsread('f2014.xlsx','U3:U82');
a2=xlsread('f2014.xlsx','V3:V82');
a3=xlsread('f2014.xlsx','W3:W82');
a4=xlsread('f2014.xlsx','X3:X82');
b1=reshape(a1*1.1,[20,4]);
b2=reshape(a2*1.1,[20,4]);
b3=reshape(a3*1.1,[20,4]);
b4=reshape(a4*1.1,[20,4]);
n_iter=4;
sz=[n_iter,20];
Q=0.001;
R=0.1;

for j=1:20
z1=b1';
xhat1=zeros(sz);
P1=zeros(sz);
xhatminus1=zeros(sz);
K1=zeros(sz);
for m=1:20
P1(1,m)=10*randn(1);
end
xhat1(1,:)=[3.5e+04,2.3e+04,2.2e+04,1.8e+04,1e+04,1.4e+04,1.3e+04,1e+04,9e+03,6e+03,9e+03,1.5e+04 ...
    1.1e+04,5e+03,4e+03,4e+03,2e+03,1e+03,860,480];
for k=2:n_iter
xhatminus1(k,j)=xhat1(k-1,j);
Pminus1(k,j)=P1(k-1,j)+Q;
K1(k,j)=Pminus1(k,j)/(Pminus1(k,j)+R);
xhat1(k,j)=xhatminus1(k,j)+K1(k,j)*(z1(k,j)-xhatminus1(k,j));
P1(k,j)=(1-K1(k,j))*Pminus1(k,j);
end
b1(j,:)=xhat1(:,j)';
end

for j=1:20
z2=b2';
xhat2=zeros(sz);
P2=zeros(sz);
xhatminus2=zeros(sz);
K2=zeros(sz);
for m=1:20
P2(1,m)=5*randn(1);
end
xhat2(1,:)=[-1.2e+04,-8e+03,-6e+03,-6.1e+03,-2e+03,-5e+03,-3e+03,-2e+03,-2.5e+03,-2e+03,-3e+03,-5e+03 ...
    -4e+03,-900,-1.2e+03,-1e+03,-500,-385,-380,200];
for k=2:n_iter
xhatminus2(k,j)=xhat2(k-1,j);
Pminus2(k,j)=P2(k-1,j)+Q;
K2(k,j)=Pminus2(k,j)/(Pminus2(k,j)+R);
xhat2(k,j)=xhatminus2(k,j)+K2(k,j)*(z2(k,j)-xhatminus2(k,j));
P2(k,j)=(1-K2(k,j))*Pminus2(k,j);
end
b2(j,:)=xhat2(:,j)';
end

for j=1:20
z3=b3';
xhat3=zeros(sz);
P3=zeros(sz);
xhatminus3=zeros(sz);
K3=zeros(sz);
for m=1:20
P3(1,m)=10*randn(1);
end
xhat3(1,:)=[8e+03,5.5e+03,6e+03,4.6e+06,3e+03,3.4e+03,3.6e+03,3e+03,2.3e+03,1.5e+03,2.4e+03,3.7e+03 ...
    2.7e+03,1.5e+03,970,960,550,300,440,260];
for k=2:n_iter
xhatminus3(k,j)=xhat3(k-1,j);
Pminus3(k,j)=P3(k-1,j)+Q;
K3(k,j)=Pminus3(k,j)/(Pminus3(k,j)+R);
xhat3(k,j)=xhatminus3(k,j)+K3(k,j)*(z3(k,j)-xhatminus3(k,j));
P3(k,j)=(1-K3(k,j))*Pminus3(k,j);
end
b3(j,:)=xhat3(:,j)';
end

for j=1:20
z4=b4';
xhat4=zeros(sz);
P4=zeros(sz);
xhatminus4=zeros(sz);
K4=zeros(sz);
for m=1:20
P4(1,m)=10*randn(1);
end
xhat4(1,:)=[9e+03,6e+03,6.5e+03,5e+03,3e+03,3.8e+03,4e+03,3.4e+03,2.5e+03,1.7e+03,2.7e+03,4.2e+03 ...
    3e+03,1.6e+03,1.1e+03,1e+03,600,300,440,400];
for k=2:n_iter
xhatminus4(k,j)=xhat4(k-1,j);
Pminus4(k,j)=P4(k-1,j)+Q;
K4(k,j)=Pminus4(k,j)/(Pminus4(k,j)+R);
xhat4(k,j)=xhatminus4(k,j)+K4(k,j)*(z4(k,j)-xhatminus4(k,j));
P4(k,j)=(1-K4(k,j))*Pminus4(k,j);
end
b4(j,:)=xhat4(:,j)';
end