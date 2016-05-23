clear all;
[fid, message]=fopen('17.txt','r');
if fid==-1
    disp(message);
else
    [A,count]=fscanf(fid,'%f %f');
    A=A';
    count;   
    fclose(fid);
end
A=reshape(A,[3 count/3]);
t=1:count/3;
figure;
plot(t,A(1,:),'r');
hold on;
plot(t,A(2,:),'g');
hold on;
plot(t,A(3,:),'b');
grid on;
legend('加速度计所得角度','陀螺仪所得角速度','卡尔曼滤波所得角度');