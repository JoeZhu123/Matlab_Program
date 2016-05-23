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
x=imread('im37.jpg');  %��ͼƬ
figure;imshow(x); %��ʾԭʼͼ
y=rgb2gray(x);      %ת���ɻҶ�ͼ��
figure;imshow(y);        %��ʾ�Ҷ�ͼ
[m,n]=size(y);
ma=max(max(y));%ȡ���ֵ
mi=min(min(y));   %ȡ��Сֵ
limen=(ma+mi)/2;  %��ֵ
yy=(y>limen);%��ֵ��
figure;imshow(yy);   %��ʾ��ֵͼ
BW = edge(y,'sobel');figure;imshow(BW);        %��ʾͼ���Ե
BW1=~BW;figure;imshow(BW1);        %��ʾȡ����ͼ���Ե
% end

