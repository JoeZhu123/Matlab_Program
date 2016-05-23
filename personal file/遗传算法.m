%遗传算法
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M=[0 5 3 7 9 3 9 2 9 0;
    7 0 7 8 3 2 3 3 5 7;
    4 8 0 9 3 5 3 3 9 3;
    6 2 10 0 8 4 1 8 0 4;
    8 6 4 6 0 8 8 7 5 9;
    8 5 4 6 6 0 4 8 0 3;
    8 6 7 9 4 3 0 7 9 5;
    6 8 2 3 8 8 6 0 5 5;
    6 3 6 2 8 3 7 8 0 5;
    5 6 7 6 6 2 8 8 9 0;];
M1=M;                   %员工间每月通话时间矩阵
for i=1:10
    for j=i+1:10
        M1(j,i)=M(i,j);
    end
end
M2=M;                %两地间通话费率矩阵
for i=1:10
    for j=i+1:10
        M2(i,j)=M(j,i);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%初始化种群
num=10;       %种群数量
code=10;       %染色体长
dai=100;        %遗传代数
inter=0.8;     %交叉率
byl=0.8;
%A=randperm(num*code);
for i=1:num
    V(i,:)=randperm(10);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for gen=1:dai

    %评估
    [num1,lin]=size(V);
    eval=zeros(num1,1);
    for i=1:num1
        for j=1:code-1
            for k=j+1:code
                eval(i)=M1(V(i,j),V(i,k))*M2(j,k)+eval(i);
            end
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %选择
    [eval1,ind]=sort(eval);
    V1=V;
    V=zeros(num,code);
    for i=1:num
        V(i,:)=V1(ind(i),:);
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %交叉
    V1=V;
    panduan=rand(fix(num),1);        %判断是否进行交叉
    for i=1:fix(num);
        if panduan(i)<inter          %在交叉概率内进行交叉
            V2=zeros(1,code);         %记录交叉后的染色体
            h=randperm(num);                %随机取两个做交叉h(1)h(2)
            a=zeros(code,1);                 %记录未使用的位置
            b=zeros(code,1);               %记录未使用的数字
            %在双亲中随机选择基因
            for i=1:code
                h2=randperm(2);                %在双亲中随机选择
                if b(V1(h(h2(1)),i))==0
                    V2(i)=V1(h(h2(1)),i);   b(V1(h(h2(1)),i))=1; a(i)=1;
                end
            end

            %随机分配未使用数字和位置
            h1=randperm(code);               %记录未使用的数字
            for i=1:code
                for j=1:code
                    if b(i)==1&&h1(j)==i
                        h1(j)=0;break
                    end
                end
            end
          
            for i=1:code
                if V2(i)==0
                    for j=1:code
                        if h1(j)~=0
                            V2(i)=h1(j);h1(j)=0;break
                        end
                    end
                end
            end
            V=[V;V2];
        end
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %变异
    V1=V;
    [num1,lin]=size(V);
    x3=rand(num1,1);
    for i=num1
        if x3(i)<byl              %变异率
            h2=randperm(code);
            V(i,h2(1))=V1(i,h2(2));
            V(i,h2(2))=V1(i,h2(1));
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%对最终种群进行评估
[num1,lin]=size(V);
eval=zeros(num1,1);
for i=1:num1
    for j=1:code-1
        for k=j+1:code
            eval(i)=M1(V(i,j),V(i,k))*M2(j,k)+eval(i);
        end
    end
end