den=conv([1 5],[1 1 0]);
K=10;
num1=[K];
[Gm1, Pm1, Wg1, Wc1]=margin(num1,den);
%
K=100;
num2=[K];
[mag,phase,w]=bode(num2,den);
[Gm2, Pm2, Wg2, Wc2]=margin(mag,phase,w);
%
[20*log10(Gm1) Pm1 Wg1 Wc1;20*log10(Gm2) Pm2 Wg2 Wc2]
