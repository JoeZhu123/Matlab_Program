clear all
Fs=1000;      %����Ƶ��
T=1/Fs;
L=1000;
t=(0:L-1)*T;
x=0.7*sin(2*pi*50*t)+sin(2*pi*120*t);
y=x+2*randn(size(t));
plot(Fs*t(1:150),y(1:150));
title('�ź������ֵ�������������');
xlabel('ʱ��/����');
ylabel('Ƶ��');