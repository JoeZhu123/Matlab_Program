function juzhenghe(A,B);
clear all;
A=input('ÇëÊäÈë¾ØÕóA£º');
B=input('ÇëÊäÈë¾ØÕóB£º');
try
      A',A+A,A+B,A*B
catch
    disp('there is error:')
end
disp(lasterr)
