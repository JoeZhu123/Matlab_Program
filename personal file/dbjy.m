function rr=dbjy(s1,s2)
v1=size(s1);
v2=size(s2);  
for s=1:v2(2)
     wii=20;
for c=1:v1(1) 
    d(c)=wii*(1-abs(s1(c)-s2(c,s))/20);
    wii=wii-1;
end
rr(s)=sum(d);
end
 end
 

 