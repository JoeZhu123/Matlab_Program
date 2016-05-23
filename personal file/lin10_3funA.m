function[f,g]=lin10_3funA(x)
f=3*x(1)^2+2*x(1)*x(2)+x(2)^2;
if nargout>1
    g(1)=6*x(1)+2*x(2);
    g(2)=2*x(1)+2*x(2);
end