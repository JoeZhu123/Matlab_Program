%Low Pass Filter
clear all;
close all;

ts=0.001;
Q=tf([1],[0.04,1]);         %Low Freq Signal Filter
Qz=c2d(Q,ts,'tustin');
[num,den]=tfdata(Qz,'v');

y_1=0;y_2=0;
r_1=0;r_2=0;
for k=1:5000

end