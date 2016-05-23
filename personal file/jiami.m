%4位数加密
n=input('输入一个四位数n=');
if n>999&&n<10000
    a=[0 0 0 0];
    a(4)=rem(10,n);
    a(3)=rem(10,n/10);
    a(2)=rem(10,n/100);
    a(1)=rem(10,n/1000);
    for i=1:4
        a(i)=rem((a(i)+7),10);
    end
    b1=a(1);
    a(1)=a(3);
    a(3)=b1;
     b2=a(2);
    a(2)=a(4);
    a(4)=b2;
    n=1000*a(1)+100*a(2)+10*a(3)+a(4);
    fprintf('加密后的四位数n为：%d\n',n);
else
    disp('Error !')
end
