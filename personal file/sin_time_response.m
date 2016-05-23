%
t=0:0.01:1;
u=sin(2*pi*t);
%
tao=0.025;
nG=[50];
dG=[0.05 1+50*tao 50];
G=tf(nG,dG);
%
y=lsim(G,u,t);
%
plot(t,u,'--',t,y,'-',t,u'-y,'-.','linewidth',1);
legend('u(t)','xo(t)','e(t)');
grid;
xlabel('t(sec)');
ylabel('x(t)');
