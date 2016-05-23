%材料移动总距离子函数
%各产品的生产路线也由禁忌搜索来得到

function S=Fun7(d,s) 
DistanV=0;
Pnum=[245 282 261 277 218 397 451 234 388 389];
P1=[1,2,3,4,5,6,8,8,8;1,2,3,4,5,8,9,10,19];
P2=[1,2,3,5,7,8,10,11,16,16;3,4,5,6,7,8,9,10,14,18];
P3=[1,4,10,11,20,20,20,20;1,4,10,12,13,14,17,17;1,4,9,12,13,14,16,17];
P5=[4,5,6,7,8,14,15,15,15,15;4,5,6,7,12,13,14,15,15,15;4,5,7,9,10,11,12,13,14,15];
P6=[2,3,4,5,6,6;2,3,4,5,7,8;2,3,4,5,7,10];
P7=[4,5,7,8,10,11,12,12;4,5,8,9,10,12,14,14;4,5,8,10,11,12,13,15];
P8=[1,2,3,4,5,6,7,8,9,10,12,12,12;1,2,3,4,5,6,7,8,9,10,11,13,14];
P9=[4,5,7,9,9,9;5,6,8,9,10,10;5,6,7,8,9,16];
P10=[9,10,11,13,13;9,10,12,12,12;10,11,12,13,15];
Num=10;%路线选择问题的规模
TabuList=zeros(Num);% (tabu list)
TabuLength=round((Num*(Num-1)/2)^0.5);%禁忌长度(tabu length)
Candidates=44;%候选集的个数 (全部邻域解个数)
CandidateNum=zeros(Num,Candidates);%候选解集合
L0(1,1:2)=randperm(2);L0(1,3)=0;%随机产生初始解
L0(2,1:2)=randperm(2);L0(2,3)=0;
L0(3,:)=randperm(3);
L0(4,:)=[1,1,1];
L0(5,:)=randperm(3);
L0(6,:)=randperm(3);
L0(7,:)=randperm(3);
L0(8,1:2)=randperm(2);L0(8,3)=0;
L0(9,:)=randperm(3);
L0(10,:)=randperm(3);
BSF=L0(:,1);
BestL=inf;
p=1;
StopL=80*Num;
while p<StopL
    if Candidates>Num*(Num-1)/2
        disp('候选解个数不大于n*(n-1)/2!');
        break;
    end 
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
    BestCandidateNum=8;                                                 %保留前BestCandidateNum个最好候选解
    BestCandidate=Inf*ones(BestCandidateNum,4);         
   S=zeros(1,Candidates);
    for i=1:Candidates
        CandidateNum(:,i)=L0(:,1);                                           
     %并行搜索下的材料移动总距离     
    DistanV=DistanV+Pnum(1)*(d(s(P1(CandidateNum(1,1),1)),s(P1(CandidateNum(1,1),2)))+d(s(P1(CandidateNum(1,1),2)),s(P1(CandidateNum(1,1),3)))...
        +d(s(P1(CandidateNum(1,1),3)),s(P1(CandidateNum(1,1),4)))+d(s(P1(CandidateNum(1,1),4)),s(P1(CandidateNum(1,1),5)))+d(s(P1(CandidateNum(1,1),5)),s(P1(CandidateNum(1,1),6)))...
        +d(s(P1(CandidateNum(1,1),6)),s(P1(CandidateNum(1,1),7)))+d(s(P1(CandidateNum(1,1),7)),s(P1(CandidateNum(1,1),8)))+d(s(P1(CandidateNum(1,1),8)),s(P1(CandidateNum(1,1),9))))...
                       +Pnum(2)*(d(s(P2(CandidateNum(2,1),1)),s(P2(CandidateNum(2,1),2)))+d(s(P2(CandidateNum(2,1),2)),s(P2(CandidateNum(2,1),3)))+d(s(P2(CandidateNum(2,1),3)),s(P2(CandidateNum(2,1),4)))...
        +d(s(P2(CandidateNum(2,1),4)),s(P2(CandidateNum(2,1),5)))+d(s(P2(CandidateNum(2,1),5)),s(P2(CandidateNum(2,1),6)))+d(s(P2(CandidateNum(2,1),6)),s(P2(CandidateNum(2,1),7)))...
        +d(s(P2(CandidateNum(2,1),7)),s(P2(CandidateNum(2,1),8)))+d(s(P2(CandidateNum(2,1),8)),s(P2(CandidateNum(2,1),9)))+d(s(P2(CandidateNum(2,1),9)),s(P2(CandidateNum(2,1),10))))...
                        +Pnum(3)*(d(s(P3(CandidateNum(3,1),1)),s(P3(CandidateNum(3,1),2)))+d(s(P3(CandidateNum(3,1),2)),s(P3(CandidateNum(3,1),3)))+d(s(P3(CandidateNum(3,1),3)),s(P3(CandidateNum(3,1),4)))...
        +d(s(P3(CandidateNum(3,1),4)),s(P3(CandidateNum(3,1),5)))+d(s(P3(CandidateNum(3,1),5)),s(P3(CandidateNum(3,1),6)))+d(s(P3(CandidateNum(3,1),6)),s(P3(CandidateNum(3,1),7)))+d(s(P3(CandidateNum(3,1),7)),s(P3(CandidateNum(3,1),8))))...
                        +Pnum(4)*(d(s(1),s(2))+d(s(2),s(3))+d(s(3),s(4))+d(s(4),s(5))+d(s(5),s(6))+d(s(6),s(7))+d(s(7),s(8))+d(s(8),s(9))+d(s(9),s(10))+d(s(10),s(11))+d(s(11),s(12))+d(s(12),s(13))...
         +d(s(13),s(14))+d(s(14),s(15))+d(s(15),s(16))+d(s(16),s(17))+d(s(17),s(18))+d(s(18),s(19))+d(s(19),s(20)))...
                        +Pnum(5)*(d(s(P5(CandidateNum(5,1),1)),s(P5(CandidateNum(5,1),2)))+d(s(P5(CandidateNum(5,1),2)),s(P5(CandidateNum(5,1),3)))+d(s(P5(CandidateNum(5,1),3)),s(P5(CandidateNum(5,1),4)))...
         +d(s(P5(CandidateNum(5,1),4)),s(P5(CandidateNum(5,1),5)))+d(s(P5(CandidateNum(5,1),5)),s(P5(CandidateNum(5,1),6)))+d(s(P5(CandidateNum(5,1),6)),s(P5(CandidateNum(5,1),7)))...
         +d(s(P5(CandidateNum(5,1),7)),s(P5(CandidateNum(5,1),8)))+d(s(P5(CandidateNum(5,1),8)),s(P5(CandidateNum(5,1),9)))+d(s(P5(CandidateNum(5,1),9)),s(P5(CandidateNum(5,1),10))))...
                        +Pnum(6)*(d(s(P6(CandidateNum(6,1),1)),s(P6(CandidateNum(6,1),2)))+d(s(P6(CandidateNum(6,1),2)),s(P6(CandidateNum(6,1),3)))...
         +d(s(P6(CandidateNum(6,1),3)),s(P6(CandidateNum(6,1),4)))+d(s(P6(CandidateNum(6,1),4)),s(P6(CandidateNum(6,1),5)))+d(s(P6(CandidateNum(6,1),5)),s(P6(CandidateNum(6,1),6))))...
                        +Pnum(7)*(d(s(P7(CandidateNum(7,1),1)),s(P7(CandidateNum(7,1),2)))+d(s(P7(CandidateNum(7,1),2)),s(P7(CandidateNum(7,1),3)))+d(s(P7(CandidateNum(7,1),3)),s(P7(CandidateNum(7,1),4)))...
         +d(s(P7(CandidateNum(7,1),4)),s(P7(CandidateNum(7,1),5)))+d(s(P7(CandidateNum(7,1),5)),s(P7(CandidateNum(7,1),6)))+d(s(P7(CandidateNum(7,1),6)),s(P7(CandidateNum(7,1),7)))+d(s(P7(CandidateNum(7,1),7)),s(P7(CandidateNum(7,1),8))))...
                        +Pnum(8)*(d(s(P8(CandidateNum(8,1),1)),s(P8(CandidateNum(8,1),2)))+d(s(P8(CandidateNum(8,1),2)),s(P8(CandidateNum(8,1),3)))+d(s(P8(CandidateNum(8,1),3)),s(P8(CandidateNum(8,1),4)))...
         +d(s(P8(CandidateNum(8,1),4)),s(P8(CandidateNum(8,1),5)))+d(s(P8(CandidateNum(8,1),5)),s(P8(CandidateNum(8,1),6)))+d(s(P8(CandidateNum(8,1),6)),s(P8(CandidateNum(8,1),7)))...
         +d(s(P8(CandidateNum(8,1),7)),s(P8(CandidateNum(8,1),8)))+d(s(P8(CandidateNum(8,1),8)),s(P8(CandidateNum(8,1),9)))+d(s(P8(CandidateNum(8,1),9)),s(P8(CandidateNum(8,1),10)))...
         +d(s(P8(CandidateNum(8,1),10)),s(P8(CandidateNum(8,1),11)))+d(s(P8(CandidateNum(8,1),11)),s(P8(CandidateNum(8,1),12)))+d(s(P8(CandidateNum(8,1),12)),s(P8(CandidateNum(8,1),13))))...  
                        +Pnum(9)*(d(s(P9(CandidateNum(9,1),1)),s(P9(CandidateNum(9,1),2)))+d(s(P9(CandidateNum(9,1),2)),s(P9(CandidateNum(9,1),3)))...
         +d(s(P9(CandidateNum(9,1),3)),s(P9(CandidateNum(9,1),4)))+d(s(P9(CandidateNum(9,1),4)),s(P9(CandidateNum(9,1),5)))+d(s(P9(CandidateNum(9,1),5)),s(P9(CandidateNum(9,1),6))))...
                        +Pnum(10)*(d(s(P10(CandidateNum(10,1),1)),s(P10(CandidateNum(10,1),2)))+d(s(P10(CandidateNum(10,1),2)),s(P10(CandidateNum(10,1),3)))...
         +d(s(P10(CandidateNum(10,1),3)),s(P10(CandidateNum(10,1),4)))+d(s(P10(CandidateNum(10,1),4)),s(P10(CandidateNum(10,1),5))));
        if i<=BestCandidateNum
            BestCandidate(i,2)=S(i);
            BestCandidate(i,1)=i;
            BestCandidate(i,3)=L0(A(i,1),1);
            BestCandidate(i,4)=L0(A(i,2),1);   
        else
            for j=1:BestCandidateNum
                if S(i)<BestCandidate(j,2)
                    BestCandidate(j,2)=S(i);
                    BestCandidate(j,1)=i;
                    BestCandidate(j,3)=L0(A(i,1),1);
                    BestCandidate(j,4)=L0(A(i,2),1);
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
        L0(:,1)=CandidateNum(:,BestCandidate(1,1));        
        BSF=L0(:,1);
        for m=1:Num
            for n=1:Num
                if TabuList(m,n)~=0
                    TabuList(m,n)=TabuList(m,n)-1;
                end
            end
        end
        TabuList(BestCandidate(1,3),BestCandidate(1,4))=TabuLength;
      else  
        for i=1:BestCandidateNum
            if  TabuList(BestCandidate(i,3),BestCandidate(i,4))==0
                L0(:,1)=CandidateNum(:,BestCandidate(1,1));              
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
    S= DistanV;
    Bestchoice=BSF;   
end