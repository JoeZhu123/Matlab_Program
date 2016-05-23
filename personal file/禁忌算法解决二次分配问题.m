%�ý����㷨������η�������
%TabuList--����������
%CandidateNum--������
%tabu length--���ɳ���
%BSF--��ǰ���Ž�
%BestL--�ӹ����в�Ʒ�����ƶ�����С�ܾ���
function [BestShortcut,theMinDistance]=QAPTabuSearch2
clear all;
clc;
d=[0	10	20	10	41	15	20	45	35	19	52	29	10	31	24	12	12	30	19	15;
10	0	28	19	36	53	37	47	17	23	11	34	24	38	26	32	24	39	14	20;
20	28	0	27	21	14	38	12	12	20	55	37	41	40	30	47	58	23	18	41;
10	19	27	0	15	24	30	38	12	19	21	25	25	19	11	30	26	43	30	53;
41	36	21	15	0	31	12	24	38	49	24	11	10	25	29	48	39	40	23	28;
15	53	14	24	31	0	30	11	26	13	38	43	26	26	17	14	19	24	10	12;
20	37	38	30	12	30	0	25	31	22	28	26	50	40	39	32	28	18	13	22;
45	47	12	38	24	11	25	0	20	40	20	20	18	10	17	54	10	10	13	12;
35	17	12	12	38	26	31	20	0	33	26	13	25	39	20	39	20	22	31	29;
19	23	20	19	49	13	22	40	33	0	19	22	13	23	23	30	20	18	48	25;
52	11	55	21	24	38	28	20	26	19	0	13	35	45	14	31	19	35	21	25;
29	34	37	25	11	43	26	20	13	22	13	0	31	48	32	27	35	18	24	14;
10	24	41	25	10	26	50	18	25	13	35	31	0	11	26	16	22	25	41	10;
31	38	40	19	25	26	40	10	39	23	45	48	11	0	32	38	24	22	21	43;
24	26	30	11	29	17	39	17	20	23	14	32	26	32	0	27	40	20	12	41;
12	32	47	30	48	14	32	54	39	30	31	27	16	38	27	0	40	14	46	23;
12	24	58	26	39	19	28	10	20	20	19	35	22	24	40	40	0	12	17	11;
30	39	23	43	40	24	18	10	22	18	35	18	25	22	20	14	12	0	36	45;
19	14	18	30	23	10	13	13	31	48	21	24	41	21	12	46	17	36	0	26;
15	20	41	53	28	12	22	12	29	25	25	14	10	43	41	23	11	45	26	0
];  %λ�ü�������
Num=size(d,1);%QAP����Ĺ�ģ,�������򲼾�λ����Ŀ
TabuLength=round((Num*(Num-1)/2)^0.5);%���ɳ���(tabu length)
TabuList=zeros(Num);% (tabu list)
Candidates=185;%��ѡ���ĸ��� (ȫ����������)
CandidateNum=zeros(Candidates,Num);%��ѡ�⼯��
S0=randperm(Num);%���������ʼ��
BSF=S0;
BestL=Inf;
tic;
p=1;
StopL=100*Num;
while p<StopL
    if Candidates>Num*(Num-1)/2
        disp('��ѡ�����������n*(n-1)/2!');
        break;
    end
    ALong(p)=Fun(d,S0);    
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
    
    BestCandidateNum=10;                                            %����ǰBestCandidateNum����ú�ѡ��
    BestCandidate=Inf*ones(BestCandidateNum,4);         
    S=zeros(1,Candidates);
    for i=1:Candidates
        CandidateNum(i,:)=S0;                                           
        CandidateNum(i,[A(i,2),A(i,1)])=S0([A(i,1),A(i,2)]);        
        S(i)=Fun(d,CandidateNum(i,:));
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
    %��BestCandidate 
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
    title('��������');
    legend('Best So Far','��ǰ��'); 
end  
end