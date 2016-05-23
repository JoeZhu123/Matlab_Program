clear all;
p=138;
M=zeros(1,100);N=zeros(1,100);W=zeros(1,100);
for  q=1:100
    k=0;
s=0;
a1=[1:6:67,4:6:70];
a2=[73:6:133,76:6:136];
a3=[2:6:68,5:6:71];
a4=[74:6:134,77:6:137];
a5=[3:6:69,6:6:72];
a6=[75:6:135,78:6:138];
i1=randperm(24);
i2=randperm(22);
i3=randperm(24);
i4=randperm(22);
i5=randperm(24);
i6=randperm(22);
A=[a1(i1),a2(i2),a3(i3),a4(i4),a5(i5),a6(i6)];
for i=1:p-1
if (A(1,i)<A(1,i+1))&&(floor((A(1,i)-1)/6)~=floor((A(1,i+1)-1)/6))
    k;
else
    k=k+1;
end
end
for i=2:p
switch(mod(A(1,i),3))
    case 0
        s;
    case 1
        for j=1:i-1
    if (A(1,j)==A(1,i)+1)||(A(1,j)==A(1,i)+2)
        s=s+1;
    end
        end
    case 2 
        for j=1:i-1 
            if A(1,j)==A(1,i)+1
                s=s+1;
            end
        end
end
end
M(1,q)=k; 
N(1,q)=s;
W(1,q)=0.5*k+s;
end
M,N,W