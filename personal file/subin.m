%在主函数中调用子函数
function s=subin(x,y)
s1=sub1(x,y);
s2=sub2(x,y);
%第一个子函数
    function s1=sub1(x,y);
        s1=x*y;
    end
    function s2=sub2(x,y);
        s2=y/x;
    end
if (x==0)|(y==0)
    error('x与y都不能为零！！！');
else
    s=s1-s2;
end
end