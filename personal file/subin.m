%���������е����Ӻ���
function s=subin(x,y)
s1=sub1(x,y);
s2=sub2(x,y);
%��һ���Ӻ���
    function s1=sub1(x,y);
        s1=x*y;
    end
    function s2=sub2(x,y);
        s2=y/x;
    end
if (x==0)|(y==0)
    error('x��y������Ϊ�㣡����');
else
    s=s1-s2;
end
end