fid=fopen('tp.txt','wt');
fprintf(fid,'This is a database of class zero.\n');
name='Sally';types=1;x=3.2;y=23;answer='Yes';
fprintf(fid,'%s Type %u %f %u %s',name,types,x,y,answer);
%---------------------------------------------------------------------%
x=[0;0.4;1.2;2;2.8;3.6;4.4;5.2;6;7.2;8;9.2;10.4;11.6;12.4;13.6;14.4;15];
y=[1;0.85;0.29;-0.27;-0.53;-0.4;-0.12;0.17;0.28;0.15;-0.03;-0.15;-0.071;0.059;0.08;0.032;-0.015;-0.02];
plot(x,y,'r*');