function [th,err,yi]=weiLs(x,y,N,xi,r)
%WeiLs.mΪʹ�ü�Ȩ��С�����������
%x,yΪ���ݵ�ϵ��
%NΪ����ʽ��ϵ�ϵ��
%rΪ��Ȩϵ���������
M=length(x);
x=x(:);
y=y(:);
%�жϵ��ú����ĸ�ʽ
if nargin==4
    %���û����ú�����ʽΪ(x,y,N,r)
    if length(xi)==M
        r=xi;
        xi=x;
        %���û����ú�����ʽΪ(x,y,N,xi)
    else r=1;
    end
elseif nargin==3
    xi=x;
    r=1;
end
%���ϵ������
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
%�������ϵ��
th=(A\y)';
ye=polyval(th,x);
err=norm(y-ye)/norm(y);
yi=polyval(th,xi);

