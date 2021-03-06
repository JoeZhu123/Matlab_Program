%材料移动总距离子函数
%各产品的生产路线也由禁忌搜索来得到

function S=Fun3(d,s) 
DistanV=0;
Pnum=[282 261 277 218 397 451 388 389];
P1=[1,2,3,5,7,8,10,10;3,4,5,6,7,8,9,10];
P2=[1,4,10;1,4,8;1,4,9];
P3=[4,5,6,8,8;4,5,6,7,7;4,5,7,9,10];
P4=[2,3,4,5,6,6;2,3,4,5,7,8;2,3,4,5,7,10];
P5=[4,5,7,8,10;4,5,8,9,10;4,5,8,10,10];
P7=[4,5,7,9,9;5,6,8,9,10;5,6,7,8,9];
P8=[8,9,10;6,7,8;3,4, 5];
Num1=8;%路线选择问题的规模
TabuList1=zeros(Num1);% (tabu list)
TabuLength1=round((Num1*(Num1-1)/2)^0.5);%禁忌长度(tabu length)
Candidates1=27;%候选集的个数 (全部邻域解个数)
CandidateNum1=zeros(Num1,Candidates1);%候选解集合
L0(1,:)=randperm(2);L0(1,3)=0;%随机产生初始解
L0(2,:)=randperm(3);
L0(3,:)=randperm(3);
L0(4,:)=randperm(3);
L0(5,:)=randperm(3);
L0(6,:)=[1,1,1];
L0(7,:)=randperm(3);
L0(8,:)=randperm(3);
BSF1=L0(:,1);
BestL1=inf;
p1=1;
StopL1=80*Num1;
while p1<StopL1
    if Candidates1>Num1*(Num1-1)/2
        disp('候选解个数不大于n*(n-1)/2!');
        break;
    end 
    i=1;
    A1=zeros(Candidates1,2);        
    while i<=Candidates1        
        M1=Num1*rand(1,2);     
        M1=ceil(M1);                          
        if M1(1)~=M1(2)
            A1(i,1)=max(M1(1),M1(2));
            A1(i,2)=min(M1(1),M1(2));     
           if i==1
                isa1=0;
            else
                for j=1:i-1
                    if A1(i,1)==A1(j,1) && A1(i,2)==A1(j,2)
                        isa1=1;
                        break;
                    else
                        isa1=0;
                    end
                end
            end 
            if ~isa1
               i=i+1;
            else 
            end            
        else 
        end
    end
    BestCandidateNum1=6;                                                 %保留前BestCandidateNum个最好候选解
    BestCandidate1=Inf*ones(BestCandidateNum1,4);         
   S=zeros(1,Candidates1);
    for i=1:Candidates1
        CandidateNum1(:,i)=L0(:,1);                                           
          
    DistanV=Pnum(1)*(d(s(P1(CandidateNum1(1,1),1)),s(P1(CandidateNum1(1,1),2)))+d(s(P1(CandidateNum1(1,1),2)),s(P1(CandidateNum1(1,1),3)))+d(s(P1(CandidateNum1(1,1),3)),s(P1(CandidateNum1(1,1),4)))+d(s(P1(CandidateNum1(1,1),4)),s(P1(CandidateNum1(1,1),5)))+d(s(P1(CandidateNum1(1,1),5)),s(P1(CandidateNum1(1,1),6)))+d(s(P1(CandidateNum1(1,1),6)),s(P1(CandidateNum1(1,1),7)))+d(s(P1(CandidateNum1(1,1),7)),s(P1(CandidateNum1(1,1),8))))...
                       +Pnum(2)*(d(s(P2(CandidateNum1(2,1),1)),s(P2(CandidateNum1(2,1),2)))+d(s(P2(CandidateNum1(2,1),2)),s(P2(CandidateNum1(2,1),3))))...
                        +Pnum(3)*(d(s(P3(CandidateNum1(3,1),1)),s(P3(CandidateNum1(3,1),2)))+d(s(P3(CandidateNum1(3,1),2)),s(P3(CandidateNum1(3,1),3)))+d(s(P3(CandidateNum1(3,1),3)),s(P3(CandidateNum1(3,1),4)))+d(s(P3(CandidateNum1(3,1),4)),s(P3(CandidateNum1(3,1),5))))...
                        +Pnum(4)*(d(s(P4(CandidateNum1(4,1),1)),s(P4(CandidateNum1(4,1),2)))+d(s(P4(CandidateNum1(4,1),2)),s(P4(CandidateNum1(4,1),3)))+d(s(P4(CandidateNum1(4,1),3)),s(P4(CandidateNum1(4,1),4)))+d(s(P4(CandidateNum1(4,1),4)),s(P4(CandidateNum1(4,1),5)))+d(s(P4(CandidateNum1(4,1),5)),s(P4(CandidateNum1(4,1),6))))...
                        +Pnum(5)*(d(s(P5(CandidateNum1(5,1),1)),s(P5(CandidateNum1(5,1),2)))+d(s(P5(CandidateNum1(5,1),2)),s(P5(CandidateNum1(5,1),3)))+d(s(P5(CandidateNum1(5,1),3)),s(P5(CandidateNum1(5,1),4)))+d(s(P5(CandidateNum1(5,1),4)),s(P5(CandidateNum1(5,1),5))))...
                        +Pnum(6)*(d(s(1),s(2))+d(s(2),s(3))+d(s(3),s(4))+d(s(4),s(5))+d(s(5),s(6))+d(s(6),s(7))+d(s(7),s(8))+d(s(8),s(9))+d(s(9),s(10)))...
                        +Pnum(7)*(d(s(P7(CandidateNum1(7,1),1)),s(P7(CandidateNum1(7,1),2)))+d(s(P7(CandidateNum1(7,1),2)),s(P7(CandidateNum1(7,1),3)))+d(s(P7(CandidateNum1(7,1),3)),s(P7(CandidateNum1(7,1),4)))+d(s(P7(CandidateNum1(7,1),4)),s(P7(CandidateNum1(7,1),5))))...
                        +Pnum(8)*(d(s(P8(CandidateNum1(8,1),1)),s(P8(CandidateNum1(8,1),2)))+d(s(P8(CandidateNum1(8,1),2)),s(P8(CandidateNum1(8,1),3))));  
        S(i)= DistanV;
        if i<=BestCandidateNum1
            BestCandidate1(i,2)=S(i);
            BestCandidate1(i,1)=i;
            BestCandidate1(i,3)=L0(A1(i,1),1);
            BestCandidate1(i,4)=L0(A1(i,2),1);   
        else
            for j=1:BestCandidateNum1
                if S(i)<BestCandidate1(j,2)
                    BestCandidate1(j,2)=S(i);
                    BestCandidate1(j,1)=i;
                    BestCandidate1(j,3)=L0(A1(i,1),1);
                    BestCandidate1(j,4)=L0(A1(i,2),1);
                    break;
                end            
            end
        end
    end
     %对BestCandidate 
    [~,Index1]=sort(BestCandidate1(:,2)); 
    SBest1=BestCandidate1(Index1,:);
    BestCandidate1=SBest1;
    
   if BestCandidate1(1,2)<BestL1                         
        BestL1=BestCandidate1(1,2);
        L0(:,1)=CandidateNum1(:,BestCandidate1(1,1));        
        BSF1=L0(:,1);
        for m=1:Num1
            for n=1:Num1
                if TabuList1(m,n)~=0
                    TabuList1(m,n)=TabuList1(m,n)-1;
                end
            end
        end
        TabuList1(BestCandidate1(1,3),BestCandidate1(1,4))=TabuLength1;
      else  
        for i=1:BestCandidateNum1
            if  TabuList1(BestCandidate1(i,3),BestCandidate1(i,4))==0
                L0(:,1)=CandidateNum1(:,BestCandidate1(1,1));              
            for m=1:Num1
                for n=1:Num1
                    if TabuList1(m,n)~=0
                        TabuList1(m,n)=TabuList1(m,n)-1;
                    end
                end
            end        
            TabuList1(BestCandidate1(i,3),BestCandidate1(i,4))=TabuLength1;
            break;
            end
        end
    end    
    p1=p1+1;
    
    Bestchoice=BSF1;   
end