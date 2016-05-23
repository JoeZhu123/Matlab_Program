%求两数相除的商，当输入的除数为0时，使用警告指令warning
function n=divy(x,y)
x=input('输入被除数x:');
y=input('输入除数y:');
if y==0
    warning('0不能作为除数(分母)！！！');
else
    n=x/y;
end
    