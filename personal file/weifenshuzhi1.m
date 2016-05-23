clear all;
close all;
options=odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4 1e-5]);                %���ó�΢�ַ��̵Ĳ���

[t,y]=ode45(@rigid,[0 12],[0 1 1],options);                                            %��ⳣ΢�ַ��̵���ֵ��
figure;
plot(t,y(:,1),'-',t,y(:,2),'--',t,y(:,3),':');                                                              %��ͼ
xlabel('Time');
legend('y1','y2','y3');
