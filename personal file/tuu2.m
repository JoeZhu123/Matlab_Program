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
A1=mean(A(1,:));
A2=mean(A(2,:));
A3=mean(A(3,:));
A4=mean(A(4,:));
figure;
plot(t,A(1,:),'r');
hold on;
plot(t,A(2,:),'g');
hold on;
plot(t,A(3,:),'b');
hold on;
plot(t,A(4,:),'k');
grid on;
legend('���ٶȼ����ýǶ�','������AR2���ý��ٶ�','������AR1���ý��ٶ�','�������˲����ýǶ�');