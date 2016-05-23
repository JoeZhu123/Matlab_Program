clear all;
x=0:0.1:20;
y1=200*exp(-0.05*x).*sin(x);
y2=0.8*exp(-0.5*x).*sin(10*x);
[AX,H1,H2]=plotyy(x,y1,x,y2,'plot');
xlabel('x')
set(get(AX(1),'Ylabel'),'String','ÂýË¥¼õ')
set(get(AX(2),'Ylabel'),'String','¿ìË¥¼õ')
set(H1,'LineStyle','--')
set(H2,'LineStyle',':')