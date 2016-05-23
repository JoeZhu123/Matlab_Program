x=0:pi/100:2*pi;
y1=2*exp(-0.5*x);
y2=cos(4*pi*x);
plot(x,y1,x,y2)
title('x from 0 to 2{\pi}');             %��ͼ�α���
xlabel('Variable X');                 %��X��˵��
ylabel('Variable Y');                  %��Y��˵��
text(0.8,1.5,'����y1=2e^{-0.5x}');      %��ָ��λ�����ͼ��˵��
text(2.5,1.1,'����y2=cos(4{\pi}x)'); 
legend('y1',' y2')                     %��ͼ��
