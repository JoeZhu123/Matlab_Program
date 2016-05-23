%Discrete PID control for continus plant
clear all;
close all;

ts=0.001;  %Sampling time
xk=zeros(2,1);
e_l=0;
u_l=0;

for k=1:1:2000
    time(k)=ts*k;
    
    rin(k)=0.5*sin(2*pi*k*ts);
    para=u_l;
    tSpan=[0 ts];
    [tt,xx]=ode45('chap1_2f',tSpan,xk,[],para);
    xk=xx(length(xx),:);
    yout(k)=xk(1);
    
    e(k)=rin(k)-yout(k);
    de(k)=(e(k)-e_l)/ts;
    u(k)=20.0*e(k)-0.5*de(k);
    
    if u(k)>10
        u(k)=10;
    end
    if u(k)<-10
        u(k)=-10;
    end
    
    e_l=e(k);
    u_l=u(k);
end
figure(1);
plot(time,rin,'y',time,yout,'b');
xlabel('time(s)');ylabel('rin,yout');
figure(2);
plot(time,rin-yout,'r');
xlabel('time(s)');ylabel('error');
    