function [RightNum] = CaiShu(n)
%��CaiShu'��һ�������ֵ�С��Ϸ��
%   ��CaiShu'��ϷҪ������1��100����������
%       ��Ϸ����ʾ�´��˻��ǲ�С�ˣ�ֱ���¶�Ϊֹ��
num=fix(rand(1)*100);
n=input('������²����֣�');
while(1)

if n>100&&n<1
    fprintf('�����������������룺');
elseif n<num
        n=input('����С�ˣ����ز£�');
elseif n>num
        n=input('���´��ˣ����ز£�');
else 
        fprintf('��ϲ���¶��ˣ�');
        break;    
end  
end
end

