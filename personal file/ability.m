clc
clear
%figure1 = figure('Color',[1 1 1]);%�����ͼ�ı�����ɫ
n1=1:4;
y1(n1,1)=[8;7;9;6];
label1={'Linux���','Mac���','OpenCV��Ӧ��','OpenGL��Ӧ��'};
subplot(1,2,1)
bar3(y1,0.5,'green')
for i = 1:length(y1)
    text(1,n1(i),y1(i)+0.5,num2str(y1(i)),'fontsize',10);
    text(-0.5,n1(i),0,label1(i))
end
title('ƽ̨����')
axis([0.5,1, 0, 5, 0, 10]) 
subplot(1,2,2)
n2=1:6;
y2(:,1)=[9;9;7;7;6;5];
label2={'C/C++','Matlab','PHP','Python','Html','R'};
bar3(y2,0.5,'green')
for i = 1:length(y2)
    text(1,n2(i),y2(i)+0.5,num2str(y2(i)),'fontsize',10);
    text(-0.5,n2(i),0,label2(i))
end
title('���뼼��')
axis([0.5,1,0,7,0,10])
grid on