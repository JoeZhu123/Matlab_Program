function s=Comtrap(~,a,b,n)
%Comtrap.m函数为复化梯形公式积分
%f为被积函数；a与b为积分的上下限
%n为子区间的个数；s为梯形总面积，即所求积分数值
h=(b-a)/(2*n);
s1=0;
s2=0;
for k=1:n
    x=a+h*(2*k-1);
    s1=s1+feval('f',x);
end
for k=1:(n-1)
    x=a+2*h*k;
    s2=s2+feval('f',x);
end
s=h*(feval('f',a)+eval('f',b)+4*s1+2*s2)/3;
