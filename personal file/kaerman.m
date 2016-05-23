clear all;
close all;
% intial parameters
n_iter = 100; %��������n_iter��ʱ��
sz = [n_iter, 1]; % size of array. n_iter�У�1��
x = 24; % �¶ȵ���ʵֵ
Q = 4e-4; % ���̷�� ��Ӧ��������ʱ���¶ȷ�����Ĳ鿴Ч��
R = 0.25; % ���������Ӧ�¶ȼƵĲ������ȡ����Ĳ鿴Ч��
z = x + sqrt(R)*randn(sz); % z���¶ȼƵĲ������������ʵֵ�Ļ����ϼ����˷���Ϊ0.25�ĸ�˹������
% ��������г�ʼ��
xhat=zeros(sz); % ���¶ȵĺ�����ơ�����kʱ�̣�����¶ȼƵ�ǰ����ֵ��k-1ʱ��������ƣ��õ������չ���ֵ
P=zeros(sz); % ������Ƶķ���
xhatminus=zeros(sz); % �¶ȵ�������ơ�����k-1ʱ�̣���kʱ���¶������Ĺ���
Pminus=zeros(sz); % ������Ƶķ���
K=zeros(sz); % ���������棬��Ӧ���¶ȼƲ�����������ģ�ͣ�����ǰʱ������һʱ���¶���ͬ��һģ�ͣ��Ŀ��ų̶�
% intial guesses
xhat(1) = 23.5; %�¶ȳ�ʼ����ֵΪ23.5��
P(1) =1; %����Ϊ1
for k = 2:n_iter
% ʱ����£�Ԥ�⣩
xhatminus(k) = xhat(k-1); %����һʱ�̵����Ź���ֵ����Ϊ�Ե�ǰʱ�̵��¶ȵ�Ԥ��
Pminus(k) = P(k-1)+Q; %Ԥ��ķ���Ϊ��һʱ���¶����Ź���ֵ�ķ�������̷���֮��
% �������£�У����
K(k) = Pminus(k)/( Pminus(k)+R ); %���㿨��������
xhat(k) = xhatminus(k)+K(k)*(z(k)-xhatminus(k)); %��ϵ�ǰʱ���¶ȼƵĲ���ֵ������һʱ�̵�Ԥ�����У�����õ�У��������Ź��ơ��ù��ƾ�����С������
P(k) = (1-K(k))*Pminus(k); %�������չ���ֵ�ķ���
end
FontSize=14;
LineWidth=3;
figure();
plot(z,'k+'); %�����¶ȼƵĲ���ֵ
hold on;
plot(xhat,'b-','LineWidth',LineWidth) %�������Ź���ֵ
hold on;
plot(x*ones(sz),'g-','LineWidth',LineWidth); %������ʵֵ
legend('�¶ȼƵĲ������', '�������', '��ʵֵ');
xl=xlabel('ʱ��(����)');
yl=ylabel('�¶�');
set(xl,'fontsize',FontSize);
set(yl,'fontsize',FontSize);
hold off;
set(gca,'FontSize',FontSize);
figure();
valid_iter = [2:n_iter]; % Pminus not valid at step 1
plot(valid_iter,P([valid_iter]),'LineWidth',LineWidth); %�������Ź���ֵ�ķ���
legend('������Ƶ�������');
xl=xlabel('ʱ��(����)');
yl=ylabel('��^2');
set(xl,'fontsize',FontSize);
set(yl,'fontsize',FontSize);
set(gca,'FontSize',FontSize);