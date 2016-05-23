clear all
x=[-2.8 -1.8 -0.8 0 0.8 1.8 2.8];
y=[-0.2278 0.7965 -1.5674 3.4786 3.0127 4.8952 3.9784]';
[x,i]=sort(x);
y=y(i);
xi=min(x)+[0:100]/100*(max(x)-min(x));
for i=1:4
         N=2*i-1;
         [h,err,yi]=WeiLs(x,y,N,xi);
         subplot(220+i);
         plot(x,y,'r+');
         hold on;
         plot(xi,yi,'b:');
         title(['The',num2str(N),'h多项式拟合']);
         xlabel('数据');ylabel('WLS拟合效果');
         grid on;
end
        