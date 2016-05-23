a1=xlsread('2014.xlsx','G3:G142');
a2=xlsread('2014.xlsx','H3:H142');
a3=xlsread('2014.xlsx','O3:O142');
fid = fopen('2014.txt','wt');
for k=1:length(a1);
 p1=num2str(a1(k));
 p2=num2str(a2(k));
 p3=num2str(a3(k));
fprintf(fid,'%c',p1);
fprintf(fid,'%c','             ');
fprintf(fid,'%c',p2);
fprintf(fid,'%c','             ');
fprintf(fid,'%c',p3);
fprintf(fid,'%c','            ');
fprintf(fid,'%c\n','');
end
fclose(fid);

