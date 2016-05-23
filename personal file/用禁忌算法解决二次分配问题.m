%用禁忌算法解决二次分配问题
%TabuList--搜索整数集
%CandidateNum--的邻域
%tabu length--禁忌长度
%BSF--当前最优解
%BestL--加工所有产品材料移动的最小总距离
function [BestShortcut,theMinDistance]=QAPTabuSearch
clear all;
clc;
d=[0,26,31,17,41,15,20,45,35,19;
    10,0,29,19,59,54,39,47,17,23;
    20,28,0,27,36,31,39,12,37,20;
    10,27,45,0,15,24,30,38,25,25;
    42,36,21,39,0,33,56,24,44,55;
    50,53,14,37,31,0,33,45,35,30;
    31,37,38,49,12,30,0,25,40,36;
    48,58,27,44,50,11,50,0,20,40;
    39,51,12,12,38,26,31,36,0,33;
    46,45,47,19,49,13,22,58,51,0];  %位置间距离矩阵
Num=size(d,1);%QAP问题的规模,即机器或布局位置数目
TabuLength=round((Num*(Num-1)/2)^0.5);%禁忌长度(tabu length)
TabuList=zeros(Num);% (tabu list)
Candidates=44;%候选集的个数 (全部邻域解个数)
CandidateNum=zeros(Candidates,Num);%候选解集合
S0=randperm(Num);%随机产生初始解
BSF=S0;
BestL=Inf;
tic;
p=1;
StopL=80*Num;
while p<StopL
    if Candidates>Num*(Num-1)/2
        disp('候选解个数不大于n*(n-1)/2!');
        break;
    end
    ALong(p)=Fun5(d,S0);    
    i=1;
    A=zeros(Candidates,2);
    while i<=Candidates        
        M=Num*rand(1,2);
        M=ceil(M);
         if M(1)~=M(2)
            A(i,1)=max(M(1),M(2));
            A(i,2)=min(M(1),M(2));
             if i==1
                isa=0;
            else
                for j=1:i-1
                    if A(i,1)==A(j,1) && A(i,2)==A(j,2)
                        isa=1;
                        break;
                    else
                        isa=0;
                    end
                end
            end 
            if ~isa
               i=i+1;
            else 
            end            
         else
         end
    end
    
    BestCandidateNum=10;                                            %保留前BestCandidateNum个最好候选解
    BestCandidate=Inf*ones(BestCandidateNum,4);         
    S=zeros(1,Candidates);
    for i=1:Candidates
        CandidateNum(i,:)=S0;                                           
        CandidateNum(i,[A(i,2),A(i,1)])=S0([A(i,1),A(i,2)]);        
        S(i)=Fun5(d,CandidateNum(i,:));
        if i<=BestCandidateNum
            BestCandidate(i,2)=S(i);
            BestCandidate(i,1)=i;
            BestCandidate(i,3)=S0(A(i,1));
            BestCandidate(i,4)=S0(A(i,2));   
        else
            for j=1:BestCandidateNum
                if S(i)<BestCandidate(j,2)
                    BestCandidate(j,2)=S(i);
                    BestCandidate(j,1)=i;
                    BestCandidate(j,3)=S0(A(i,1));
                    BestCandidate(j,4)=S0(A(i,2));
                    break;
                end            
            end
        end
    end
    %对BestCandidate 
    [~,Index]=sort(BestCandidate(:,2)); 
    SBest=BestCandidate(Index,:);
    BestCandidate=SBest;
    
       if BestCandidate(1,2)<BestL                         
        BestL=BestCandidate(1,2);
        S0=CandidateNum(BestCandidate(1,1),:);        
        BSF=S0;
        for m=1:Num
            for n=1:Num
                if TabuList(m,n)~=0
                    TabuList(m,n)=TabuList(m,n)-1;
                end
            end
        end
        TabuList(BestCandidate(1,3),BestCandidate(1,4))=TabuLength;
      else  
        for i=1:BestCandidateNum;
            if  TabuList(BestCandidate(i,3),BestCandidate(i,4))==0
                S0=CandidateNum(BestCandidate(i,1),:);                
            for m=1:Num
                for n=1:Num
                    if TabuList(m,n)~=0
                        TabuList(m,n)=TabuList(m,n)-1;
                    end
                end
            end        
            TabuList(BestCandidate(i,3),BestCandidate(i,4))=TabuLength;
            break;
            end
        end
       end
    p=p+1;
    ArrBestL(p)=BestL;
    toc;
    BestShortcut=BSF;
    theMinDistance=BestL;
    plot(ArrBestL,'r'); hold on;
    plot(ALong,'b');grid;
    title('搜索过程');
    legend('Best So Far','当前解'); 
end  
end





















    





















