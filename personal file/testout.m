function [varargout]=testout(a)
for k=1 : nargout
    %元胞数组赋值，等号左边是单元数组，花括号及其中的k表示单元数组的一个单元
    varargout{1}=a(k,:);
end