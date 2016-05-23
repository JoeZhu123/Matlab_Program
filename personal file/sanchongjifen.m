clear all;
f=inline('z*cos(x)+y*sin(x)','x','y','z');
q=triplequad(f,0,pi,0,1,-1,1);
q1=triplequad(@(x,y,z) (z*cos(x)+y*sin(x)),0,pi,0,1,-1,1);
q2=triplequad(@(x,y,z) (z*cos(x)+y*sin(x)),0,pi,0,1,-1,1,1.e-10);
q3=triplequad(@(x,y,z) (z*cos(x)+y*sin(x)),0,pi,0,1,-1,1,1.e-10,@quad);