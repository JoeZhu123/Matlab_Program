clear all;
close all;
a1=xlsread('2014.xlsx','G3:G142');
a2=xlsread('2014.xlsx','H3:H142');
a3=xlsread('2014.xlsx','O3:O142');
b1=reshape(a1,[20,7]);
b2=reshape(a2,[20,7]);
b3=reshape(a3,[20,7]);
n_iter=7;
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
xhat1(1,:)=[7e+05,5e+05,4e+05,3.2e+05,3e+05,2.5e+05,2.3e+05,2.2e+05,2e+05,4e+05,1.5e+05,1.5e+05 ...
    1.2e+05,3.5e+05,1e+05,9e+04,6e+05,5e+05,6e+04,2.7e+04,];
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
xhat2(1,:)=[7600,6400,5000,4000,3400,3000,2800,2700,2400,4500,1800,1700 ...
    1500,4000,1200,1100,7100,6500,700,300];
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
xhat3(1,:)=[350000,4000,500,400,600,3000,600,200,2000,1500,100,10000 ...
    50,50000,2000,200,1000,1000,2000,8000];
for k=2:n_iter
xhatminus3(k,j)=xhat3(k-1,j);
Pminus3(k,j)=P3(k-1,j)+Q;
K3(k,j)=Pminus3(k,j)/(Pminus3(k,j)+R);
xhat3(k,j)=xhatminus3(k,j)+K3(k,j)*(z3(k,j)-xhatminus3(k,j));
P3(k,j)=(1-K3(k,j))*Pminus3(k,j);
end
b3(j,:)=xhat3(:,j)';
end









