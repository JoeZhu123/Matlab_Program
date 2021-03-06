clear all;
n=5;m=0.8;
delta=0.05;
x=0:delta:10;
syms x1;
y1=exp(x1^m)*sin(n*x1);
diffy1=diff(y1);
numdiffy1=subs(diffy1,x1,x);
diffy2=diff(diffy1);
numdiffy2=subs(diffy2,x1,x);
diffy3=diff(diffy2);
numdiffy3=subs(diffy3,x1,x);
diffy4=diff(diffy3);
numdiffy4=subs(diffy4,x1,x);
y=exp(x.^m).*sin(n*x);
[dx1 y1]=centraldiff(y,delta,1);
subplot(2,2,1);plot(x,numdiffy1,dx1,y1,'r:');
xlabel('数据');ylabel('函数曲线');
[dx2 y2]=centraldiff(y,delta,2);
subplot(2,2,2);plot(x,numdiffy2,dx2,y2,'r:');
xlabel('数据');ylabel('导数');
[dx3 y3]=centraldiff(y,delta,3);
subplot(2,2,3);plot(x,numdiffy3,dx3,y3,'r:');
xlabel('数据');ylabel('函数曲线');
[dx4 y4]=centraldiff(y,delta,4);
subplot(2,2,4);plot(x,numdiffy4,dx4,y4,'r:');
xlabel('数据');ylabel('函数曲线');

