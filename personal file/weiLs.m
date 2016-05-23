function [th,err,yi]=weiLs(x,y,N,xi,r)
%WeiLs.m为使用加权最小方差拟合数据
%x,y为数据点系列
%N为多项式拟合的系数
%r为加权系数的逆矩阵
M=length(x);
x=x(:);
y=y(:);
%判断调用函数的格式
if nargin==4
    %当用户调用函数格式为(x,y,N,r)
    if length(xi)==M
        r=xi;
        xi=x;
        %当用户调用函数格式为(x,y,N,xi)
    else r=1;
    end
elseif nargin==3
    xi=x;
    r=1;
end
%求解系数矩阵
A(:,N+1)=ones(M,1);
for n=N:-1:1
    A(:,n)=A(:,n+1).*x;
end
if length(r)==M
    for m=1:M
        A(m,:)=A(m,:)/r(m);
        y(m)=y(m)/r(m);
    end
end
%计算拟合系数
th=(A\y)';
ye=polyval(th,x);
err=norm(y-ye)/norm(y);
yi=polyval(th,xi);

