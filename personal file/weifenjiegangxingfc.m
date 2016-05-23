clear all;
close all;
[t,y]=ode15s(@vdp1000,[0 3000],[2 0]);              %求解刚性方程
figure;
plot(t,y(:,1),'-o');