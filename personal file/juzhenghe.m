function juzhenghe(A,B);
clear all;
A=input('���������A��');
B=input('���������B��');
try
      A',A+A,A+B,A*B
catch
    disp('there is error:')
end
disp(lasterr)
