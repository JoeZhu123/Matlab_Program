clear all;
n=2^10;
M=zeros(n);
I=1:n;
x=I-n/2;
y=n/2-I;
[X,Y]=meshgrid(x,y);
R=10;
A=(X.^2+Y.^2<=R^2);
M(A)=1;
imagesc(M)
colormap([0 0 0;1 1 1])
axis image
title('圆孔');
figure;D1=fft2(M);       %二维傅里叶变换
D2=fftshift(D1);         %直流分量
imagesc(abs(D2))
axis image
colormap(hot)
title('衍射图样')
