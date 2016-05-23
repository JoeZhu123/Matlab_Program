function y=RK2(f,h,a,b,y0,varvec)
%RK2.m为用二阶龙格-库塔法求微分方程的解
%f为一般常微分方程的一般表达式的右端函数
%h为积分步长
%a为自变量取值下限
%b为自变量取值上限
%y0:函数初值
%varvec为常微分方程的变量组
format long;
N=(b-a)/h;
y=zeros(N+1,1);
y(1)=y0;
x=a:h:b;
var =findsym(f);
for i=2:N+1
      v1=Funval(f,varvec,[x(i-1) y(i-1)]);
      t=y(i-1)+h*v1/2;
      v2=Funval(f,varvec,[x(i)+h/2 t]);
      y(i)=y(i-1)+h*v2;
end
format short;