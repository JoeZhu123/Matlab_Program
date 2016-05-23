function z=bzgc(j)
s=length(j);
z=zeros(s,1);
j1=max(j);
j2=min(j);
for i=1:s
    z(i)=(j(i)-j2)/(j1-j2);
end
end
