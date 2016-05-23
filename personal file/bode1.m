k=24;
nunG1=k*[0.25 0.5];
denG1=cov([5 2],[0.05 2]);
w=logspace(-2,3,100);
%
%
bode(nunG1,denG1,w);