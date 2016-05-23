hh =1.0e+003 * [0.5920    0.8100    0.9397    1.7430    1.1080    0.9433    1.1970    1.1127    1.0757    0.1410    0.6403    0.4057    0.2610    0.0870...
               0.0870    0.0870    0.2217    0.2217    0.0727    0.2647]';
 D=[0	26	31	17	41	15	20	45	35	19;
10	0	29	19	59	54	39	47	17	23;
20	28	0	27	36	31	39	12	37	20;
10	27	45	0	15	24	30	38	25	25;
42	36	21	39	0	33	56	24	44	55;
50	53	14	37	31	0	33	45	35	30;
31	37	38	49	12	30	0	25	40	36;
48	58	27	44	50	11	50	0	20	40;
39	51	12	12	38	26	31	36	0	33;
46	45	47	19	49	13	22	58	51	0];
w=1000000000000;
for a=1:10
   for b=1:10
     for c=1:10
         for d=1:10
             for e=1:10
                 for f=1:10
                     for g=1:10
                         for h=1:10
                             for i=1:10
                                 for j=1:10
                                     if   ( b==a)
                                         continue;
                                     elseif (c==a &&c==b)
                                         continue;
                                     elseif (d==a &&d==b &&d==c)
                                         continue;
                                     elseif (e==a &&e==b &&e==c &&e==d)
                                         continue;
                                     elseif (f==a &&f==b &&f==c &&f==d &&f==e)
                                         continue;
                                     elseif (g==a &&g==b &&g==c &&g==d &&g==e &&g==f)
                                         continue;
                                     elseif (h==a &&h==b &&h==c &&h==d &&h==e &&h==f&&h==g)
                                         continue;
                                     elseif (i==a &&i==b &&i==c &&i==d &&i==e &&i==f&&i==g &&i==h)
                                         continue;
                                     elseif (j==a &&j==b &&j==c &&j==d &&j==e &&j==f&&j==g &&j==h &&j==i)
                                         continue;
                                     else
                                         y=D(a,b)*hh(1)+D(b,c)*hh(2)+D(c,d)*hh(3)+D(d,e)*hh(4)+D(e,f)*hh(5)+D(f,g)*hh(6)+D(g,h)*hh(7)+...
                                             D(h,i)*hh(8)+D(i,j)*hh(9)+D(c,e)*hh(10)+D(e,g)*hh(11)+D(h,j)*hh(12)+D(a,d)*hh(13)+D(d,j)*hh(14)+...
                                             D(d,h)*hh(15)+D(d,i)*hh(16)+D(f,h)*hh(17)+D(g,i)*hh(18)+D(g,j)*hh(19)+D(e,h)*hh(20);
                                     end
                                     if (w>y)
                                         w=y;
                                         p=[a,b,c,d,e,f,g,h,i,j];
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
end
w
p
                                         
                                        
                                         
                 
   
        