clear all;
a=0;b=2;
tic                                 %��quad��������ּ�ʱ��ʼ
[Q1,fcnt1]=quad(@li8_25fun,0,2);
toc                                %������ʱ
tic                                 %��quadl��������ּ�ʱ��ʼ
[Q2,fcnt2]=quadl(@li8_25fun,0,2);
toc                                %������ʱ