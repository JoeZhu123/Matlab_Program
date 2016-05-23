function [RightNum] = CaiShu(n)
%‘CaiShu'是一个猜数字的小游戏！
%   ‘CaiShu'游戏要求输入1至100内任意数，
%       游戏会提示猜大了还是猜小了，直至猜对为止。
num=fix(rand(1)*100);
n=input('请输入猜测数字：');
while(1)

if n>100&&n<1
    fprintf('输入有误，请重新输入：');
elseif n<num
        n=input('您猜小了，请重猜：');
elseif n>num
        n=input('您猜大了，请重猜：');
else 
        fprintf('恭喜您猜对了！');
        break;    
end  
end
end

