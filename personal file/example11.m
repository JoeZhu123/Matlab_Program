A=[0 1 -1;-6  -11 6;-6 -11 5];
B=[0 0 1];
C=[1 0 0];
D=0;
omga=logspace(-1,1);
[m,p]=bode(A,B,C,D,1,omga) ;
subplot(2,1,1),semilogx(omga,20*log10(m));
subplot(2,1,2),semilogx(omga,p);
[X,Y]=nyquist(A,B,C,D,1,omga); 
plot(X,Y) ;
[Gm,Pm,omgacg,omgacp]=margin(A,B,C,D);
%练习1.1
num=4*conv(conv([1,2],[1,6,6]),[1,6,6]);
den=conv(conv(conv(conv([1,0],[1,1]),[1,1]),[1,1]),[1,3,2,5]);
G1=tf(num,den);
 [A,B,C,D]=tf2ss(num,den);
 G2=ss(A,B,C,D);
  [Z,P,K]=tf2zpk(num,den);
  G3= zpk(Z,P,K);
  %练习1.2
num=[4,-2];
den=[1,0,2,5];
G1=tf(num,den);
 [A,B,C,D]=tf2ss(num,den);
 G2=ss(A,B,C,D);
  [Z,P,K]=tf2zpk(num,den);
  G3= zpk(Z,P,K);
  %练习1.3
 Z=[];
P=[-0.5 -2];
K=1;
G1=zpk(Z,P,K);
 [A,B,C,D]=zp2ss(Z,P,K);
 G2=ss(A,B,C,D);
  [num,den]=zp2tf(Z,P,K);
  G3= tf(num,den);
  %练习1.4
A=[0,1;-1,-2];
B=[0; 1];
C=[0,1];
D=[0];
G1=ss(A,B,C,D);
 [Z,P,K]=ss2zp(A,B,C,D);
 G2=zpk(Z,P,K);
  [num,den]=ss2tf(A,B,C,D);
  G3= tf(num,den);
  %练习2
   Z=[];
 P=[0 -2 -0.25];
 K=1;
 G1=zpk(Z,P,K);
 [num,den]=zp2tf(Z,P,K);
  G2= tf(num,den);
  [num1,den1]=cloop(num,den,-1);
  G3=tf(num1,den1);
  rlocus(num,den);
title('根轨迹');[k,p]=rlocfind(num,den);
   %练习3
    num=10;
 den=[1 0 -1];
 G=tf(num,den);
 num1=[0.3 1];
 den1=[0 1];
 G1=tf(num1,den1);  
  [num2,den2]=feedback(num,den,num1,den1,-1);
  G2= tf(num2,den2);
  t=[0:0.01:8];
%绘制系统的单位阶跃响应曲线
[y2a,T]=step(G2,t);
plot(T,y2a,'r--');
title('系统的单位阶跃响应曲线');
grid on;xlabel('t(sec)'),ylabel('x(t)');
%计算上升时间，峰值时间，超调量，延迟时间
   t1=0:0.001:1;
  yss=1;dta=0.02;
   y2=step(G2,t1);
    r=1;while y2(r)<yss;r=r+1;end
    tr2=(r-1)*0.001;[ymax,tp]=max(y2);
    tp2=(tp-1)*0.001;mp2=(ymax-yss)/yss;
    s=1001;while y2(s)>1-dta&&y2(s)<1+dta;s=s-1;end
    ts2=(s-1)*0.001;
     [tr2  tp2 mp2 ts2]
     %实验四
     k=10;
      Z=[];
 P=[0 -4 -10];
 K=40;
 G1=zpk(Z,P,K);
 [num1,den1]=zp2tf(Z,P,K);
 [num2,den2]=series(k,1,num1,den1);
  G2= tf(num2,den2);
  t=[0:0.001:1];
%绘制原系统的单位阶跃响应曲线
[y2a,T]=step(G2,t);
plot(T,y2a,'r--');
title('原系统的单位阶跃响应曲线');
grid on;xlabel('t(sec)'),ylabel('x(t)');
%校正前
w=logspace(-1,2,200);
[mag,phase,w]=bode(tf(num2,den2),w);
margin(G2);
[Gm,Pm,Wcg,Wcp]=margin(mag,phase,w);
[20*log10(Gm) Pm]


%校正参数计算
emest=13.4;
omegac=2.42;
a=omegac*sqrt(0.25^2*omegac^2+1)*sqrt(0.1^2*omegac^2+1)/10;
TT=1/(a*omegac*tan(emest*pi/180));
%校正后
     k=10;
      Z=[-1/(a*TT)];
 P=[0 -4 -10 -1/TT];
 K=40/TT;
 G1=zpk(Z,P,K);
 [num1,den1]=zp2tf(Z,P,K);
 [num2,den2]=series(k,1,num1,den1);
  G2= tf(num2,den2);
w=logspace(-1,2,200);
[mag,phase,w]=bode(tf(num2,den2),w);
margin(G2);
[Gm,Pm,Wcg,Wcp]=margin(mag,phase,w);
[20*log10(Gm) Pm]
     
   
   
   
   
