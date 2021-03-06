%%%  禁忌搜索算法解决TSP问题
%此题以中国31省会城市的最短旅行路径为例：
%禁忌搜索是对局部领域搜索的一种扩展,是一种全局逐步寻优算法,搜索过程可以接受劣解,有较强的爬山能力.领域结构对收敛性有很大影响。
function [BestShortcut,theMinDistance]=TabuSearch
clear;
clc;
Clist=[1304 2312;3639 1315;4177 2244;3712 1399;3488 1535;3326 1556;3238 1229;...
    4196 1044;4312  790;4386  570;3007 1970;2562 1756;2788 1491;2381 1676;...
    1332  695;3715 1678;3918 2179;4061 2370;3780 2212;3676 2578;4029 2838;...
    4263 2931;3429 1908;3507 2376;3394 2643;3439 3201;2935 3240;3140 3550;...
    2545 2357;2778 2826;2370 2975];
CityNum=size(Clist,1);%TSP问题的规模,即城市数目
dislist=zeros(CityNum); 
for i=1:CityNum
    for j=1:CityNum
        dislist(i,j)=((Clist(i,1)-Clist(j,1))^2+(Clist(i,2)-Clist(j,2))^2)^0.5;       
    end
end
TabuList=zeros(CityNum);% (tabu list)
TabuLength=round((CityNum*(CityNum-1)/2)^0.5);%禁忌长度(tabu length)
Candidates=200;%候选集的个数 (全部邻域解个数)
CandidateNum=zeros(Candidates,CityNum);%候选解集合
S0=randperm(CityNum);%随机产生初始解
BSF=S0;
BestL=Inf;
clf; 
figure(1);
stop = uicontrol('style','toggle','string','stop','background','white');
tic;
p=1;
StopL=80*CityNum;
while p<StopL
    if Candidates>CityNum*(CityNum-1)/2
        disp('候选解个数不大于n*(n-1)/2!');
        break;
    end
    ALong(p)=Fun(dislist,S0);    %ALong是什么
    i=1;
    A=zeros(Candidates,2);         %A是什么，200行2列矩阵，A的任意行的第一列都比第二列大，但都小于31
    while i<=Candidates        
        M=CityNum*rand(1,2);     
        M=ceil(M);                          %M是两个随机的比31小的整数
        if M(1)~=M(2)
            A(i,1)=max(M(1),M(2));
            A(i,2)=min(M(1),M(2));     %A的第一列比第二列大，但都小于31
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
    
    BestCandidateNum=100;%保留前BestCandidateNum个最好候选解
    BestCandidate=Inf*ones(BestCandidateNum,4);         %最好候选解是100行4列的矩阵
    F=zeros(1,Candidates);
    for i=1:Candidates
        CandidateNum(i,:)=S0;                                           %候选解集合是200行31列矩阵
        CandidateNum(i,[A(i,2),A(i,1)])=S0([A(i,1),A(i,2)]);        
        F(i)=Fun(dislist,CandidateNum(i,:));
        if i<=BestCandidateNum
            BestCandidate(i,2)=F(i);
            BestCandidate(i,1)=i;
            BestCandidate(i,3)=S0(A(i,1));
            BestCandidate(i,4)=S0(A(i,2));   
        else
            for j=1:BestCandidateNum
                if F(i)<BestCandidate(j,2)
                    BestCandidate(j,2)=F(i);
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
        for m=1:CityNum
            for n=1:CityNum
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
            for m=1:CityNum
                for n=1:CityNum
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
    ArrBestL(p)=BestL; %#ok<AGROW>
    for i=1:CityNum-1
        plot([Clist(BSF(i),1),Clist(BSF(i+1),1)],[Clist(BSF(i),2),Clist(BSF(i+1),2)],'bo-');
        hold on;
    end
    plot([Clist(BSF(CityNum),1),Clist(BSF(1),1)],[Clist(BSF(CityNum),2),Clist(BSF(1),2)],'ro-');
    title(['Counter:',int2str(p*Candidates),'  The Min Distance:',num2str(BestL)]);
    hold off;
    pause(0.005);    
    if get(stop,'value')==1
       break;
    end
end
toc;
BestShortcut=BSF;
theMinDistance=BestL;
set(stop,'style','pushbutton','string','close', 'callback','close(gcf)');
figure(2);
plot(ArrBestL,'r'); hold on;
plot(ALong,'b');grid;
title('搜索过程');
legend('Best So Far','当前解');
end

function F=Fun(dislist,s) %#ok<DEFunNU>
DistanV=0;
n=size(s,2);
for i=1:(n-1)
    DistanV=DistanV+dislist(s(i),s(i+1));
end
DistanV=DistanV+dislist(s(n),s(1));      
F=DistanV;
end