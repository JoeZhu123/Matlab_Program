%SubObjF1.m 
function v=SubObjF1(k,x,u)
%阶段k的指标函数 
c=[0.9,0.8,0.5,0.5,0.4];
 v=1-(1-c(k)).^ u; 
v= -v;%将求max转换为求min 
