t=0:1:7;
a=6.*t-6;
v=3.*t.^2-6.*t-9;
x=t.^3-3.*t.^2-9.*t+5;
plot(t,a,'b--');
hold on;
plot(t,v,'r--');
plot(t,x,'b-');
hold off;
grid on;
legend('a-t','v-t','x-t');
title('a,v,x-t');
xlabel('t');
ylabel('a or v or x');

