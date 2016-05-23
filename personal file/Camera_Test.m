obj=videoinput('winvideo',1,'YUY2_640x480');
preview(obj);
start(obj);

for i=1:30
frame=getsnapshot(obj);
filename=int2str(i);
filename=['im',filename,'.jpg'];
imwrite(frame,filename);
pause(0.1);
end

for i=30:60
frame=getsnapshot(obj);
filename=int2str(i);
filename=['im',filename,'.jpg'];
imwrite(frame,filename);
pause(0.1);
end

% for j=1:60
% imagename=int2str(j);
% imagename=['im',imagename,'.jpg'];
x=imread('im37.jpg');  %读图片
figure;imshow(x); %显示原始图
y=rgb2gray(x);      %转化成灰度图像
figure;imshow(y);        %显示灰度图
[m,n]=size(y);
ma=max(max(y));%取最大值
mi=min(min(y));   %取最小值
limen=(ma+mi)/2;  %阈值
yy=(y>limen);%二值化
figure;imshow(yy);   %显示二值图
BW = edge(y,'sobel');figure;imshow(BW);        %显示图像边缘
BW1=~BW;figure;imshow(BW1);        %显示取反后图像边缘
% end

