function gz=guigu(h,q)
if q<60
    gz=84*q-700;
end
if q<=120&&q>=60
    gz=84*q;     
end
if q>120
    gz=84*120+(q-120)*1.15*84;
end
fprintf('%d的工资为%f$\n.',h,gz);
end

