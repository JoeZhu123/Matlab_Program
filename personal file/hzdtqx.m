%���ƶ�������
x1=linspace(0,2*pi,100);
x2=linspace(0,3*pi,100);
x3=linspace(0,4*pi,100);
y1=sin(x1);
y2=1+sin(x2);
y3=2+sin(x3);
x=[x1;x2;x3]';
y=[y1;y2;y3]';
plot(x,y,x1,y1-1);

