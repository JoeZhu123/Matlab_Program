%材料移动总距离子函数
function S=Fun4(d,s) 
DistanV=0;
DistanV=DistanV+282/2*(d(s(1),s(2))+d(s(2),s(3))+d(s(3),s(5))+d(s(5),s(7))+d(s(7),s(8))+d(s(8),s(10))+d(s(3),s(4))+d(s(4),s(5))+d(s(5),s(6))+d(s(6),s(7))+d(s(7),s(8))+d(s(8),s(9))+d(s(9),s(10)))...
                        +261/3*(d(s(1),s(4))+d(s(4),s(10))+d(s(1),s(4))+d(s(4),s(8))+d(s(1),s(4))+d(s(4),s(9)))...
                        +277/3*(d(s(4),s(5))+d(s(5),s(6))+d(s(6),s(8))+d(s(4),s(5))+d(s(5),s(6))+d(s(6),s(7))+d(s(4),s(5))+d(s(5),s(7))+d(s(7),s(9))+d(s(9),s(10)))...
                        +218/3*(d(s(2),s(3))+d(s(3),s(4))+d(s(4),s(5))+d(s(5),s(6))+d(s(2),s(3))+d(s(3),s(4))+d(s(4),s(5))+d(s(5),s(7))+d(s(7),s(8))++d(s(2),s(3))+d(s(3),s(4))+d(s(4),s(5))+d(s(5),s(7))+d(s(7),s(10)))...
                        +397/3*(d(s(4),s(5))+d(s(5),s(7))+d(s(7),s(8))+d(s(8),s(10))+d(s(4),s(5))+d(s(5),s(8))+d(s(8),s(9))+d(s(9),s(10))+d(s(4),s(5))+d(s(5),s(8))+d(s(8),s(10)))...
                        +451*(d(s(1),s(2))+d(s(2),s(3))+d(s(3),s(4))+d(s(4),s(5))+d(s(5),s(6))+d(s(6),s(7))+d(s(7),s(8))+d(s(8),s(9))+d(s(9),s(10)))...
                        +388/3*(d(s(4),s(5))+d(s(5),s(7))+d(s(7),s(9))+d(s(5),s(6))+d(s(6),s(8))+d(s(8),s(9))+d(s(9),s(10))+d(s(5),s(6))+d(s(6),s(7))+d(s(7),s(8))+d(s(8),s(9)))...
                        +389/3*(d(s(8),s(9))+d(s(9),s(10))+d(s(6),s(7))+d(s(7),s(8))+d(s(3),s(4))+d(s(4),s(5)));    
S=DistanV;
end