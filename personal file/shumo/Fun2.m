%材料移动总距离子函数
%计算8种产品各种生产路线组合的流量
%Pi(n,10)---第i种产品生产工艺路线矩阵,
%n代表可选生产路线种数，如P1(2,10)表示产品1有2条生产路线
function S=Fun(dislist,s) 

    DistanV=0;
    n=size(s,2);
    P1(2,10)=[1 1 1 0 1 0 1 1 0 1 ; 
                0 0 1 1 1 1 1 1 1 1];
    P2(3,10)=[1 0 0 1 0 0 0 0 0 1;
                1 0 0 1 0 0 0 1 0 0;
                1 0 0 1 0 0 0 0 1 0];
    P3(3,10)=[0 0 0 1 1 1 0 1 0 0;
                0 0 0 1 1 1 1 0 0 0;
                0 0 0 1 1 0 1 0 1 1];
    P4(3,10)=[0 1 1 1 1 1 0 0 0 0;
                0 1 1 1 1 0 1 1 0 0;
                0 1 1 1 1 0 1 0 0 1]; 
    P5(3,10)=[0 0 0 1 1 0 1 1 0 1;
                0 0 0 1 1 0 0 1 1 1;
                0 0 0 1 1 0 0 1 0 1]; 
    P6(1,10)=[1 1 1 1 1 1 1 1 1 1];             
    P7(3,10)=[0 0 0 1 1 0 1 0 1 0;
                0 0 0 0 1 1 0 1 1 1;
                0 0 0 0 1 1 1 1 1 0];
    P8(3,10)=[0 0 0 0 0 0 0 1 1 1;
                0 0 0 0 0 1 1 1 0 0;
                0 0 1 1 1 0 0 0 0 0]; 
    Pnum=[282 261 277 218 397 451 388 389];
    a=zeros(10,10);
    for c1=1:2
        for c2=1:3
            for c3=1:3
                for c4=1:3
                    for c5=1:3
                        for c7=1:3
                            for c8=1:3
                                for k=8:(-1):1
                                     j=2;
                                    for i=1:10 
                                        while j<10
                                            if P8(c8,i)==1&&P8(c8,j)==1
                                                 if P7(c7,i)==1&&P7(c7,j)==1
                                                      if P5(c5,i)==1&&P5(c5,j)==1
                                                           if P4(c4,i)==1&&P4(c4,j)==1
                                                                if P3(c3,i)==1&&P3(c3,j)==1
                                                                     if P2(c2,i)==1&&P2(c2,j)==1
                                                                          if P1(c1,i)==1&&P1(c1,j)==1
                                                                               a(i,j)=a(i,j)+Pnum(6)+Pnum(1)+Pnum(2)+Pnum(3)+Pnum(4)+Pnum(5)+Pnum(7)+Pnum(8);                                                                                
                                                                          end
                                                                           a(i,j)=a(i,j)+Pnum(6)+Pnum(1)+Pnum(2)+Pnum(3)+Pnum(4)+Pnum(5)+Pnum(7);                                                                          
                                                                     end
                                                                      a(i,j)=a(i,j)+Pnum(6)+Pnum(1)+Pnum(2)+Pnum(3)+Pnum(4)+Pnum(5);                                                                    
                                                                end
                                                                a(i,j)=a(i,j)+Pnum(6)+Pnum(1)+Pnum(2)+Pnum(3)+Pnum(4); 
                                                           end
                                                            a(i,j)=a(i,j)+Pnum(6)+Pnum(1)+Pnum(2)+Pnum(3); 
                                                      end
                                                      a(i,j)=a(i,j)+Pnum(6)+Pnum(1)+Pnum(2); 
                                                 end
                                                a(i,j)=a(i,j)+Pnum(1)+Pnum(6); 
                                            end
                                             j=j+1;
                                        end                      
                                    end
                                end                                
                            end
                        end
                    end
                end
            end
        end
    end
     
    
    for i=1:(n-1)
        DistanV=DistanV+dislist(s(i),s(i+1));
    end
    DistanV=DistanV+dislist(s(n),s(1));      
    S=DistanV;
end