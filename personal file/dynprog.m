function [p_opt,fval]=dynprog(x,DecisF1,SubObjF1,TransF1,ObjF1)
% x是状态变量，一列代表一个阶段的所有状态； 
% M-函数DecisFun(k,x) 由阶段k的状态变量x求出相应的允许决策变量; 
% M-函数SubObjFun(k,x,u) 是阶段指标函数, 
% M-函数ObjFun(v,f) 是第k阶段至最后阶段的总指标函数 
% M-函数TransFun(k,x,u) 是状态转移函数, 其中x是阶段k的某状态变量, u是相应的决策变量; 
%输出 p_opt由4列构成，p_opt=[序号组;最优策略组;最优轨线组;指标函数值组]； 
%输出 fval是一个列向量，各元素分别表示p_opt各最优策略组对应始端状态x的最优函数值。
k=length(x(1,:));	% 判断决策级数
 x_isnan=~isnan(x);	% 非空状态矩阵 
t_vubm=inf*ones(size(x));	% 性能指标 中间矩阵
f_opt=nan*ones(size(x));	% 总性能指标 矩阵 
d_opt=f_opt; % 每步决策 矩阵  
tmp1=find(x_isnan(:,k));	% 最后一步状态向量 
tmp2=length(tmp1); % 最后一步状态 个数 
for i=1:tmp2 
   u=feval(DecisF1,k,x(tmp1(i),k));
   tmp3=length(u); % 决策变量      
   for j=1:tmp3 % 求出当前状态下所有决策的最小性能指标        
        tmp=feval(SubObjF1,k,x(tmp1(i),k),u(j));
        if tmp <= t_vubm(i,k) %t_vub  
            f_opt(i,k)=tmp;
            d_opt(i,k)=u(j);
            t_vubm(i,k)=tmp;
        end;
   end;
end	
for ii=k-1:-1:1 
	tmp10=find(x_isnan(:,ii));
    tmp20=length(tmp10);
    for i=1:tmp20               %求出当前状态下所有可能的决策       
        u=feval(DecisF1,ii,x(tmp10(i),ii));
        tmp30=length(u);
        for j=1:tmp30           %求出当前状态下所有决策的最小性能指标 
        tmp00=feval(SubObjF1,ii,x(tmp10(i),ii),u(j));
        % 单步性能指标
        tmp40=feval(TransF1,ii,x(tmp10(i),ii),u(j)); % 下一状态
        tmp50=x(:,ii+1)-tmp40;          % 找出下一状态在 x 矩阵的位置
        tmp60=find(tmp50==0);
        if ~isempty(tmp60)
            if nargin<5
                tmp00=tmp00+f_opt(tmp60(1),ii+1); % set the default object value
            else
                tmp00=feval(ObjF1,tmp00,f_opt(tmp60(1),ii+1));
            end %当前状态的性能指标
            if tmp00<=t_vubm(i,ii)	
                f_opt(i,ii)=tmp00;
                d_opt(i,ii)=u(j);
                t_vubm(i,ii)=tmp00;
            end;
        end;
        end;
    end;
end; 
fval=f_opt(:,1);
tmp0 = find(~isnan(fval));
fval=fval(tmp0,1);
p_opt=[];
tmpx=[];
tmpd=[];
tmpf=[];
tmp01=length(tmp0);
for i=1:tmp01 
 tmpd(i)=d_opt(tmp0(i),1);
 tmpx(i)=x(tmp0(i),1);
 tmpf(i)=feval(SubObjF1,1,tmpx(i),tmpd(i)); 
 p_opt(k*(i-1)+1,[1,2,3,4])=[1,tmpx(i),tmpd(i),tmpf(i)];
 for ii=2:k 
   tmpx(i)=feval(TransF1,ii,tmpx(i),tmpd(i));
   tmp1=x(:,ii)-tmpx(i);tmp2=find(tmp1==0);
   if ~isempty(tmp2)
       tmpd(i)=d_opt(tmp2(1),ii);
   end;
   tmpf(i)=feval(SubObjF1,ii,tmpx(i),tmpd(i)); 
 p_opt(k*(i-1)+ii,[1,2,3,4])=[ii,tmpx(i),tmpd(i),tmpf(i)];
 end;
end; 