function df0=Threespline(func,x0,n,h)
%Threespline.m����Ϊ��������������ֵ΢��
%funcΪ������;x0Ϊ�������󵼵�
% n�ȷַ���;hΪ����
%df0Ϊ���׵���ֵ
format long;
node_num=2*n+1;
for i=1:node_num
    y(i)=subs(sym(func),findsym(sym(func)),x0-n*h+i*h-h);
end
y_1=(-3*y(1)+4*y(2)-y(3))/(2*h);
y_N=(3*y(2*n+1)-4*y(2*n)+3*y(2*n-1))/(2*h);
c=SubBSample(h,2*n,y,y_1,y_N);
df0=(y(n+1)-c(n+2))*6/h/h;
format short;


