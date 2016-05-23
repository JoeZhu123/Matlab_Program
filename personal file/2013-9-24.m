%matlab基础学习
%程序停留pause()函数,()里写时间秒
%
%
clear 
n=input('输入n= ');
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
     disp('其成绩等级为：',r);