function X=wuli(g)
m1=input('m1=');
m2=input('m2=');
theta=input('theta=');
T=pi*theta/180;
B=[0 m1*g 0 m2*g]';
A=[m1*cos(T),-m1,-sin(T),0;m1*sin(T),0,cos(T),0;0,m2,-sin(T),0;0,0,-cos(T),1];
X=A\B;
end