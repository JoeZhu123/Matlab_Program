ts=0.01;
for k=1:1:3000
    time(k)=k*ts;
   end
plot(time,yout,'r');