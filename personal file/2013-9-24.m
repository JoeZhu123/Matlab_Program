%matlab����ѧϰ
%����ͣ��pause()����,()��дʱ����
%
%
clear 
n=input('����n= ');
if n>=90
    r='A'
elseif n>=80
    r='B'
elseif n>=70
    r='C'
elseif n>=60
    r='D'
else
     r='E'
end
     disp('��ɼ��ȼ�Ϊ��',r);