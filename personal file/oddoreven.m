%Script file:oddoreven.m
%
%Purpose:judge the number among 1 to 10,
%tell the user it's odd or even;
%Record of revisions:
%Date   Programmer   Descriptionofchange
%======  =========   ===================
%
%Define variables:
value=input('The number you want to judge:');
switch (value)
case {1, 3, 5, 7, 9},
disp('The value is odd.');
case {2, 4, 6, 8, 10},
disp('The value is even.');
otherwise,
disp('The value is out of range.');
end