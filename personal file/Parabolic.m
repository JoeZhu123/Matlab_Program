function z=Parabolic(f,a0,b0)
%Parabolic.mΪ�����͹�ʽ
%fΪ��������;a0��b0Ϊ��������������
%zΪ�����ֵ����Ļ���ֵ
h=(b0-a0)/2;
c=zeros(1,3);
c=[feval('f',a0),feval('f',(a0+b0)/2),feval('f',b0)];
s=h*(c(1)+4*c(2)+c(3))/3;
z=s;
