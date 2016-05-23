t=0:0.001:1;
yss=1;
dta=0.02;
%
nG=[50];
tao=0;dG=[0.05 1+50*tao 50];G1=tf(nG,dG);
tao=0.0125;dG=[0.05 1+50*tao 50];G2=tf(nG,dG);
tao=0.025;dG=[0.05 1+50*tao 50];G3=tf(nG,dG);
%
y1=step(G1,t);
y2=step(G2,t);
y3=step(G3,t);
%
r=1;
while y1(r)<yss;
    r=r+1;
end
tr1=(r-1)*0.001;
%
[ymax,tp]=max(y1);tp1=(tp-1)*0.001;
%
mp1=(ymax-yss)/yss;
%
s=1001;
while y1(s)>1-dta&&y1(s)<1+dta;
    s=s-1;
end
ts1=(s-1)*0.001;
%
r=1;
while y2(r)<yss;
    r=r+1;
end
tr2=(r-1)*0.001;
[ymax,tp]=max(y2);tp2=(tp-1)*0.001;
mp2=(ymax-yss)/yss;
s=1001;
while y2(s)>1-dta&&y2(s)<1+dta;
    s=s-1;
end
ts2=(s-1)*0.001;
%
r=1;
while y3(r)<yss;
    r=r+1;
end
tr3=(r-1)*0.001;
[ymax,tp]=max(y3);tp3=(tp-1)*0.001;
mp3=(ymax-yss)/yss;
s=1001;
while y3(s)>1-dta&&y3(s)<1+dta;
    s=s-1;
end
ts3=(s-1)*0.001;
%
[tr1 tp1 mp1 ts1;tr2 tp2 mp2 ts2;tr3 tp3 mp3 ts3]



