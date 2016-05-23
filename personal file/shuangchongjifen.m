clear all
syms x;
f=inline('x*cos(y)+y*sin(x)','x','y');
y=dblquad(f,pi,2*pi,0,pi);                          %采用内联函数,双重积分
y1=dblquad(@integrnd,pi,2*pi,0,pi);     %采用函数句柄,双重积分
y2=dblquad(@(x,y) x*cos(y)+y*sin(x),pi,2*pi,0,pi);      %采用匿名函数,双重积分