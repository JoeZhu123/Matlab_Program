x=zeros(5,1);
f=zeros(6,1);
v=zeros(5,1);
u=zeros(5,1);
k=5;
while x(1)==1000
    u(k)=x(k);
    v(k)=4*x(k)+u(k);
    f(k)=v(k)+f(k+1);
    x(k+1)=0.9*x(k)-0.1*u(k);    
     k=k-1;
end


