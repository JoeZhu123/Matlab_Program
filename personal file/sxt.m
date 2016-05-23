clear all
close all
obj=videoinput('winvideo',1,'YUY2_640*480');
obj=videoinput('winvideo',1,'YUY2_640x480');
preview(obj);
start(obj);
for i=1:10
frame=getsnapshot(obj);
filename=int2str(i);
filename=['im',filename,'.jpg'];
imwrite(frame,filename);
pause(0.5);
end
