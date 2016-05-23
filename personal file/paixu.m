a=input('a=');
for i=1:9
        for j=i+1:10
            if a(i)>a(j)
                 a(i)=a(i)+a(j);
                 a(j)=a(i)-a(j);
                 a(i)=a(i)-a(j);
              end
end
end
disp(a);