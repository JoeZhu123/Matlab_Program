clear all;
a=0;b=2;
tic                                 %用quad函数求积分计时开始
[Q1,fcnt1]=quad(@li8_25fun,0,2);
toc                                %结束计时
tic                                 %用quadl函数求积分计时开始
[Q2,fcnt2]=quadl(@li8_25fun,0,2);
toc                                %结束计时