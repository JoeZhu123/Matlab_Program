clear all;
[fid, message]=fopen('adc.txt','r');
if fid==-1
    disp(message);
else
    [A,count]=fscanf(fid,'%f %f',[2 9119]);
    A=A';
    count;   
    fclose(fid);
end
close all;
hang=count/2;
t=1:hang;
figure;
plot(t,A(:,1),'r');
hold on;
plot(t,A(:,2),'b');
legend('ÂË²¨ºó','ÂË²¨Ç°');
hold off;

