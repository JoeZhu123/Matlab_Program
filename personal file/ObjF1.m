%ObjF1.m 
function y=ObjF1(v,f) %基本方程中的函数g 
y=v*f;
y=-y; %将求max转换为求min 