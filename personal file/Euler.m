function f=Euler(f,x0,y0,xn,N)
%Euler.m����Ϊ��ŷ�������΢�ַ���
%fΪ��΢�ַ��̵�һ����ʽ���Ҷ˺���
%x0,y0Ϊ��ʼ����
%xnΪȡֵ��Χ��һ���˵�
%NΪ����ĸ���
%xΪ���΢�ַ������ֵ
x=zeros(1,N+1);                 %xΪXn���ɵ�����
y=zeros(1,N+1);                 %yΪYn���ɵ�����
x(1)=x0;
y(1)=y0;
h=(xn-x0)/N;
for n=1:N
    x(n+1)=x(n)+h;
    y(n+1)=y(n)+h*feval(f,x(n),y(n));
end
T=[x',y']