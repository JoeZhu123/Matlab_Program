clear all;
[fid, message]=fopen('20.txt','r');
if fid==-1
    disp(message);
else
    [A,count]=fscanf(fid,'%f %f');
    A=A';
    count;   
    fclose(fid);
end
A=reshape(A,[4,count/4]);
t=1:count/4;
  acc=A(1,:);
  gyro2=A(1,:); 
  Angle=zeros(1,t);
  angle_0=0;
angle_1=0;
angle_2=0;
Q=0.01;
R=40;
 P_0=1.8;
  P_1=1.8;
   P_2=1.8;
  Kg=0; 
  for i=1:t
    if acc(1,i)>800
        acc(1,i) =800;
    end
	if acc(1,i)<-800
        acc(1,i) =-800;
    end
    
	acc(1,i) = -asin(acc(1,i)/800)*180/pi;
	w(1,i) = (gyro2(1,i)-1728.0)/(9*0.67);   
    
         angle_1 = angle_0+w(1,i)*0.005;
		P_1 = sqrt(P_0^2+Q^2);
		Kg = sqrt(P_1^2/(P_1^2+R^2));
		angle_2 = angle_1+Kg*(acc(1,i)-angle_1);
		P_2 = sqrt((1-Kg)*P_1^2);

		Angle(1,i) =	angle_2;
        
        angle_0 = angle_2;
		P_0 = P_2;
  end
figure;
plot(t,acc(1,:),'r');
hold on;
plot(t,Angle(1,:),'g');
hold on;
plot(t,A(3,:)/100,'b');
hold on;
plot(t,A(4,:),'k');
grid on;
legend('加速度计所得角度','计算机卡尔曼滤波所得角速度','陀螺仪AR1积分所得角速度','单片机卡尔曼滤波所得角度');