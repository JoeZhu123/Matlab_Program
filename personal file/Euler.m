function f=Euler(f,x0,y0,xn,N)
%Euler.m函数为用欧拉法求解微分方程
%f为常微分方程的一般表达式的右端函数
%x0,y0为初始条件
%xn为取值范围的一个端点
%N为区间的个数
%x为求解微分方程组的值
x=zeros(1,N+1);                 %x为Xn构成的向量
y=zeros(1,N+1);                 %y为Yn构成的向量
x(1)=x0;
y(1)=y0;
h=(xn-x0)/N;
for n=1:N
    x(n+1)=x(n)+h;
    y(n+1)=y(n)+h*feval(f,x(n),y(n));
end
T=[x',y']