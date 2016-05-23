clear all;
close all;
options=odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4 1e-5]);                %设置常微分方程的参数

[t,y]=ode45(@rigid,[0 12],[0 1 1],options);                                            %求解常微分方程的数值解
figure;
plot(t,y(:,1),'-',t,y(:,2),'--',t,y(:,3),':');                                                              %绘图
xlabel('Time');
legend('y1','y2','y3');
