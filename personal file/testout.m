function [varargout]=testout(a)
for k=1 : nargout
    %Ԫ�����鸳ֵ���Ⱥ�����ǵ�Ԫ���飬�����ż����е�k��ʾ��Ԫ�����һ����Ԫ
    varargout{1}=a(k,:);
end