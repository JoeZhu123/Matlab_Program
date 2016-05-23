function dy=wei7(x,y)
dy=zeros(2,1);
dy(1)=y(2);
dy(2)=exp(x)+cos(x)-y(1);
end