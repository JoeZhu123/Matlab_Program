t=[0:0.01:0.8];
%
nG=[50];
tao=0;dG=[0.05 1+50*tao 50];G1=tf(nG,dG);
tao=0.0125;dG=[0.05 1+50*tao 50];G2=tf(nG,dG);
tao=0.025;dG=[0.05 1+50*tao 50];G3=tf(nG,dG);
%
[y1,T]=impulse(G1,t);[y1a,T]=step(G1,t);
[y2,T]=impulse(G2,t);[y2a,T]=step(G2,t);
[y3,T]=impulse(G3,t);[y3a,T]=step(G3,t);
%
subplot(1,2,1);
plot(T,y1,'--',T,y2,'-.',T,y3,'-');
legend('tao=0','tao=0.0125','tao=0.025');
xlabel('t(sec)'),ylabel('x(t)');grid on;
subplot(1,2,2);
plot(T,y1a,'--',T,y2a,'-.',T,y3a,'-');
legend('tao=0','tao=0.0125','tao=0.025');
xlabel('t(sec)'),ylabel('x(t)');grid on;

