function [avg,med]=calculate(u);
%������calculate���������Ӻ���������ʸ����ƽ��ֵ����ֵ
%��ò�������
n=length(u);
%�����Ӻ���average
avg=average(u,n);
%�����Ӻ���median
med=median(u,n);
%�����Ӻ���average,����ƽ��ֵ
function a=average(v,n);
a=sum(v)/n;
%�����Ӻ���median,������ֵ
function m=median(v,n);
%��ʸ����������
w=sort(v);
if rem(n,2)==1
    m=w((n+1)/2);
else
    m=(w(n/2)+w(n/2+1))/2;
end