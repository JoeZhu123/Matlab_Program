clear all
syms x;
f=inline('x*cos(y)+y*sin(x)','x','y');
y=dblquad(f,pi,2*pi,0,pi);                          %������������,˫�ػ���
y1=dblquad(@integrnd,pi,2*pi,0,pi);     %���ú������,˫�ػ���
y2=dblquad(@(x,y) x*cos(y)+y*sin(x),pi,2*pi,0,pi);      %������������,˫�ػ���