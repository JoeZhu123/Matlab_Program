nunG1=200;
denG1=[1 8 100];
w=logspace(-1,3,100);
%
[Gm,Pm,w]=bode(nunG1,denG1,w);
%
[Mr,k]=max(Gm);
Mr=20*log10(Mr);
Wr=w(k);
%
M0=20*log10(Gm(1));
%
n=1;
while 20*log10(Gm(n))>=-3;
    n=n+1;
end
Wb=w(n);
