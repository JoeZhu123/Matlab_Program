function [avg,med]=calculate(u);
%主函数calculate调用两个子函数求输入矢量的平均值和中值
%获得参数长度
n=length(u);
%调用子函数average
avg=average(u,n);
%调用子函数median
med=median(u,n);
%定义子函数average,计算平均值
function a=average(v,n);
a=sum(v)/n;
%定义子函数median,计算中值
function m=median(v,n);
%对矢量进行排序
w=sort(v);
if rem(n,2)==1
    m=w((n+1)/2);
else
    m=(w(n/2)+w(n/2+1))/2;
end