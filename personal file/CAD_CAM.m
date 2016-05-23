while(1)
A=input('A点坐标向量a=');
B=input('B点坐标向量b=');
C=input('C点坐标向量c=');
A1=[A(1) B(1) C(1) A(1)];
A2=[A(2) B(2) C(2) A(2)];
plot(A1,A2);
axis([-100 100 -100 100]);
title('CAD/CAM原理实验一：图形旋转变换');
xlabel('X轴');
ylabel('Y轴');
grid on;
J=input('旋转角度（度）j=');
K=input('K点坐标向量k=');
R=[cosd(J) sind(J) 0
    -sind(J) cosd(J) 0
    -K(1)*cosd(J)+K(2)*sind(J)+K(1) -K(1)*sind(J)-K(2)*cosd(J)+K(2) 1];
D=[A(1) A(2) 1
        B(1) B(2) 1
        C(1) C(2) 1];
Q=D*R;
if (A(2)-B(2))*(A(1)-C(1))==(A(2)-C(2))*(A(1)-B(1))
    continue;
else 
    disp(Q);    
      B1=[Q(1) Q(2) Q(3) Q(1)];
      B2=[Q(4) Q(5) Q(6) Q(4)];      
      hold on;
      plot(B1,B2,'r');      
      break;
end
end
fprintf('恭喜您旋转变换成功！');
