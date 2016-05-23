clear all;
[fid, message]=fopen('image.txt','r');
if fid==-1
    disp(message);
else
    [A,count]=fscanf(fid,'%f %f');
    A=A';
    count;   
    fclose(fid);
end
A=reshape(A,[160 240]);
imshow(A);