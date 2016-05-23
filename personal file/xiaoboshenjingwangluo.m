M=size(input,2); 
N=size(output,2); 

n=14; 
lr1=0.01; 
lr2=0.001;
maxgen=120; 
Wjk=randn(n,M);Wjk_1=Wjk;Wjk_2=Wjk_1;
Wij=randn(N,n);Wij_1=Wij;Wij_2=Wij_1;
a=randn(1,n);a_1=a;a_2=a_1;
b=randn(1,n);b_1=b;b_2=b_1;
y=zeros(1,N);
net=zeros(1,n);
net_ab=zeros(1,n);
d_Wjk=zeros(n,M);
d_Wij=zeros(N,n);
d_a=zeros(1,n);
d_b=zeros(1,n);
[inputn,inputps]=mapminmax(input');
[outputn,outputps]=mapminmax(output'); 
inputn=inputn';
outputn=outputn';
for i=1:maxgen
    error(i)=0;
 for kk=1:size(input,1)
    x=inputn(kk,:);
    yqw=outputn(kk,:);
for j=1:n
    for k=1:M
        net(j)=net(j)+Wjk(j,k)*x(k);
        net_ab(j)=(net(j)-b(j))/a(j);
    end
        temp=mymorlet(net_ab(j));
    for k=1:N
        y=y+Wij(k,j)*temp;   
    end
 end
 error(i)=error(i)+sum(abs(yqw-y));
 for j=1:n
        temp=mymorlet(net_ab(j));
        for k=1:N
            d_Wij(k,j)=d_Wij(k,j)-(yqw(k)-y(k))*temp;
        end
            temp=d_mymorlet(net_ab(j));
for k=1:M
        for l=1:N
        d_Wjk(j,k)=d_Wjk(j,k)+(yqw(l)-y(l))*Wij(l,j) ;
        end
        d_Wjk(j,k)=-d_Wjk(j,k)*temp*x(k)/a(j);
end
for k=1:N
    d_b(j)=d_b(j)+(yqw(k)-y(k))*Wij(k,j);
    d_b(j)=d_b(j)*temp/a(j);
 %¼ÆËãd_a
    for k=1:N
        d_a(j)=d_a(j)+(yqw(k)-y(k))*Wij(k,j);
    end
    d_a(j)=d_a(j)*temp*((net(j)-b(j))/b(j))/a(j);
 end
 Wij=Wij-lr1*d_Wij;
Wjk=Wjk-lr1*d_Wjk;
 b=b-lr2*d_b;
a=a-lr2*d_a;
d_Wjk=zeros(n,M);
 d_Wij=zeros(N,n);
 d_a=zeros(1,n);
 d_b=zeros(1,n);
  y=zeros(1,N);
net=zeros(1,n);
net_ab=zeros(1,n);
 Wjk_1=Wjk;Wjk_2=Wjk_1;
Wij_1=Wij;Wij_2=Wij_1;
 a_1=a;a_2=a_1;
 b_1=b;b_2=b_1;
 end 
 end
x=mapminmax('apply',input_test',inputps);
x=x';
for i=1:96
    x_test=x(i,:);
    for j=1:1:n
        for k=1:1:M
        net(j)=net(j)+Wjk(j,k)*x_test(k);
        net_ab(j)=(net(j)-b(j))/a(j);
        end
    temp=mymorlet(net_ab(j));
    for k=1:N
    y(k)=y(k)+Wij(k,j)*temp ; 
    end
    end
yuce(i)=y(k);
y=zeros(1,N);
 net=zeros(1,n);
net_ab=zeros(1,n);
end
ynn=mapminmax('reverse',yuce,outputps);
figure(1)
plot(ynn,'r*:')
hold on
plot(output_test,'bo--')
title('Ô¤²â¹¦ÂÊ','fontsize',12)
legend('Ô¤²â¹¦ÂÊ','Êµ¼Ê¹¦ÂÊ')
xlabel('Ê±¼äµã')
ylabel('·¢µç¹¦ÂÊ')