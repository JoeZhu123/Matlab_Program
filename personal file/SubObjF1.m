%SubObjF1.m�0�2
function v=SubObjF1(k,x,u)
%�׶�k��ָ�꺯���0�2
c=[0.9,0.8,0.5,0.5,0.4];
 v=1-(1-c(k)).^ u; 
v= -v;%����maxת��Ϊ��min�0�2
