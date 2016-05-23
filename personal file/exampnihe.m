tdata = [ 0. 25 0. 5 0. 75 1 1. 5 2 2. 5 3 3. 5 4 4. 5 5 6 7 8 9 10 11 12 13 14 15 16 ];
ydata = [ 30 68 75 82 82 77 68 68 58 51 50 41 38 35 28 25 18 15 12 10 7 7 4 ];
c0 = [ 1 1 1 ];
for i = 1: 50
c = lsqcurvefit( 'Examp', c0, tdata, ydata) ;
c0 = c; %以计算出的c为初值进行迭代;
end
y1 = c (1) * ( exp ( - c (2) * tdata) - exp ( - c (3) * tdata) ) ;
plot ( tdata, ydata, '+', tdata, y1) ; 
legend ( '实验数据', '拟合曲线');