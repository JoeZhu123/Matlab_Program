%��������
%n--���ԳԵ������Ӹ���
%m--ʣ����Һ���(��)
%x--���ӵ���(Ԫ/��)
%y--һ���ҵȼ����Һ˵���Ŀ(��)
%s--��֧������ʽ�(Ԫ)
x=0.1;
y=3;
s=1;
n=0;
m=s/x;
while(m>3)    
n=n+(m-mod(m,y))/y;
m=mod(m,y)+(m-mod(m,y))/y;
end
n=n+s/x;
