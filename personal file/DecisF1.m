%DecisF1.m 
function u=DecisF1(k,x) %在阶段k由状态变量x的值求出其相应的决策变量所有的取值 
if k==5
    u=x; 
else 
    u=1:x-1;
end 
