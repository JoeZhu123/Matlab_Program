t1=1;
t2=6;
t3=4;
t4=4;
t5=6;
t6=6;
t7=7;
t8=1;
R=12;
C=6;
%LM=zeros(R,C);
%
%LM= reshape(randperm(R*C),[R,C]);
Tm1=0;
for i=1:R
Tm1=Tm1+(t1*i+4+t2)*6;
end
%
Tm2=0;
for i2=1:R
end
%
figure on;
Tm=[Tm1;Tm2;Tm3;Tm4;Tm5;];
bar(Tm);
legend on;
ylabel('Time (seconds)');
title('Mean time to board small sized aircraft' );






