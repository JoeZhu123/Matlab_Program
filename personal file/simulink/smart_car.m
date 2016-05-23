%smart_car 角度滤波 模拟仿真
Kalman_time=0.005;
%状态变换阵
 A1_1 = 1;
 A1_2 = -1*Kalman_time;
 A2_1 = 0;
 A2_2 = 1;
 B1_1 = Kalman_time;
 B2_1 = 0;
 H1_1 = 1;
 H1_2 = 0;
%系数阵  
 Pest1_1;          %先验估计协方差阵 
 Pest1_2;
 Pest2_1;
 Pest2_2;    
 Psta1_1 = 1;      %后验估计协方差阵
 Psta1_2 = 1;  
 Psta2_1 = 1;  
 Psta2_2 = 1;   
 Q1_1 = 0.00001;   %过程激励噪声协方差，0.00001即可
 Q1_2 = 0;  
 Q2_1 = 0;  
 Q2_2 = 0.00001;   %0.00001即可
 K1_1;             %卡尔曼增益
 K2_1;    
 
R=2;          %观测噪声协方差，主要调此参数

 I1_1 = 1;         %单位阵
 I1_2 = 0;  
 I2_1 = 0;  
 I2_2 = 1;   
%状态阵
 Xest1_1;         %先验状态估计
 Xest2_1;          
 Xsta1_1 = 0;      %后验状态估计
 Xsta2_1 = 0;    
 th_acc=0;
 w_gyro=0;
 th_acc =  0     ; 		%加速度计测量的角度
 w_gyro =  0 ;		%陀螺仪测量的角速度
    
    
    %**********************卡尔曼滤波**********************%
    Xest1_1 = Xsta1_1 + A1_2*Xsta2_1 + B1_1*w_gyro;
    Xest2_1 = Xsta2_1;
    
    Pest1_1 = (Psta1_1 + A1_2*Psta2_1) + (Psta1_2 + A1_2*Psta2_2)*A1_2 + Q1_1;
    Pest1_2 =  Psta1_2 + A1_2*Psta2_2;
    Pest2_1 = Psta2_1 + Psta2_2*A1_2;
    Pest2_2 = Psta2_2 + Q2_2;

    K1_1 = Pest1_1/(Pest1_1 + R);
    K2_1 = Pest2_1/(Pest1_1 + R);

    Xsta1_1 = Xest1_1+K1_1*(th_acc - Xest1_1);        
    Xsta2_1 = Xest2_1+K2_1*(th_acc - Xest1_1);        

    Psta1_1 = (I1_1-K1_1) * Pest1_1;   
    Psta1_2 = (I1_1-K1_1) * Pest1_2;
    Psta2_1 =  -K2_1*Pest1_1 + Pest2_1; 
    Psta2_2 =  -K2_1*Pest1_2+  Pest2_2; 
    
    angle = Xsta1_1;		%滤波后的角度值
    angular = w_gyro - Xsta2_1;	%滤波后的角速度值
    
    
    
%smart_car 直立PID 模拟仿真
TE=2000;
ts=0.005;
bl=10;
balance_duty=0;
angle_p=0;
gyro_d=0;
angle_set=57.9;
angular_set=0;
for k=1:TE
balance_duty=angle_p*(angle_set-angle(k))+gyro_d*(angular_set-angular);
end
