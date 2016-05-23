clear all;
t=0:pi/20:2*pi;
x=[t;sin(t)];
delete chap17_11.txt
[fid, message]=fopen('chap17_11.txt','wt');
if fid==-1
    disp(message);
else
    fprintf(fid,'%3.6f %3.6f\n',x);
    fclose(fid);
end
[fid, message]=fopen('chap17_11.txt','r');
if fid==-1
    disp(message);
else
    [A,count]=fscanf(fid,'%f %f',[2 21]);
    A=A';
    count    
    fclose(fid);
end
close all;
figure;
plot(A(:,1),A(:,2));
xlabel('t');
ylabel('sin(t)');
