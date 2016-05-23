function z=Parabolic(f,a0,b0)
%Parabolic.m为抛物型公式
%f为被积函数;a0与b0为被积区间上下限
%z为输出的值所求的积分值
h=(b0-a0)/2;
c=zeros(1,3);
c=[feval('f',a0),feval('f',(a0+b0)/2),feval('f',b0)];
s=h*(c(1)+4*c(2)+c(3))/3;
z=s;
