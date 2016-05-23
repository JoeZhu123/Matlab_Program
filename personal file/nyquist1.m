k=24;
nunG1=k*[0.25 0.5];
denG1=conv([5 2],[0.05 2]);
[re,im]=nyquist(nunG1,denG1);
%
plot(re,im);grid