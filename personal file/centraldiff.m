function [dx dy]=centraldiff(y,delta,n)
%centraldiff.m函数为用中心差商法
%y为需要进行差商的函数
%delta为给定的误差容限
%n为指定的阶数
%dx ,dy为求得的微分值
yi1=[y 0 0 0 0 0];
yi2=[0 y 0 0 0 0];
yi3=[0 0 y 0 0 0];
yi4=[0 0 0 y 0 0];
yi5=[0 0 0 0 y 0];
yi6=[0 0 0 0 0 y];
switch n
    case 1
        dy=(-diff(yi1)+7*diff(yi2)+7*diff(yi3)-diff(yi4))/(12*delta);
        L=3;
    case 2
        dy=(-diff(yi1)+15*diff(yi2)-15*diff(yi3)-diff(yi4))/(12*delta^2);
        L=3;
    case 3
        dy=(-diff(yi1)+7*diff(yi2)-6*diff(yi3)-6*diff(yi4)+7*diff(yi5)-diff(yi6))/(8*delta^3);
        L=5;
    case 4
        dy=(-diff(yi1)+11*diff(yi2)-28*diff(yi3)+28*diff(yi4)-11*diff(yi5)+diff(yi6))/(6*delta^4);
        L=5; 
end
dy=dy(L+1:end-L);
dx=([1:length(dy)]+L-2-(n-2))*delta;
