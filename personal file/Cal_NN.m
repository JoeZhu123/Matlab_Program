%Calculate the N!
n=input('Please input the N:\n');
n_factorial = 1;
for ii = 1 : n
n_factorial = n_factorial * ii;
end
fprintf('N!=%d \n',n_factorial);