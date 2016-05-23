function [p_opt,fval]=dynprog(x,DecisF1,SubObjF1,TransF1,ObjF1)
%�0�2x��״̬������һ�д���һ���׶ε�����״̬���0�2
%�0�2M-����DecisFun(k,x)�0�2�ɽ׶�k��״̬����x�����Ӧ��������߱���;�0�2
%�0�2M-����SubObjFun(k,x,u)�0�2�ǽ׶�ָ�꺯��,�0�2
%�0�2M-����ObjFun(v,f)�0�2�ǵ�k�׶������׶ε���ָ�꺯���0�2
%�0�2M-����TransFun(k,x,u)�0�2��״̬ת�ƺ���,�0�2����x�ǽ׶�k��ĳ״̬����,�0�2u����Ӧ�ľ��߱���;�0�2
%����0�2p_opt��4�й��ɣ�p_opt=[�����;���Ų�����;���Ź�����;ָ�꺯��ֵ��]���0�2
%����0�2fval��һ������������Ԫ�طֱ��ʾp_opt�����Ų������Ӧʼ��״̬x�����ź���ֵ��
k=length(x(1,:));	%�0�2�жϾ��߼���
 x_isnan=~isnan(x);	%�0�2�ǿ�״̬����0�2
t_vubm=inf*ones(size(x));	%�0�2����ָ��0�2�м����
f_opt=nan*ones(size(x));	%�0�2������ָ��0�2����0�2
d_opt=f_opt; %�0�2ÿ�����߁0�2����0�2�0�2
tmp1=find(x_isnan(:,k));	%�0�2���һ��״̬�����0�2
tmp2=length(tmp1); %�0�2���һ��״̬�0�2�����0�2
for i=1:tmp2 
   u=feval(DecisF1,k,x(tmp1(i),k));
   tmp3=length(u); %�0�2���߱����0�2�0�2�0�2�0�2�0�2�0�2
   for j=1:tmp3 %�0�2�����ǰ״̬�����о��ߵ���С����ָ��0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2
        tmp=feval(SubObjF1,k,x(tmp1(i),k),u(j));
        if tmp <= t_vubm(i,k) %t_vub�0�2�0�2
            f_opt(i,k)=tmp;
            d_opt(i,k)=u(j);
            t_vubm(i,k)=tmp;
        end;
   end;
end	
for ii=k-1:-1:1 
	tmp10=find(x_isnan(:,ii));
    tmp20=length(tmp10);
    for i=1:tmp20               %�����ǰ״̬�����п��ܵľ��߁0�2�0�2�0�2�0�2�0�2�0�2�0�2
        u=feval(DecisF1,ii,x(tmp10(i),ii));
        tmp30=length(u);
        for j=1:tmp30           %�����ǰ״̬�����о��ߵ���С����ָ��0�2
        tmp00=feval(SubObjF1,ii,x(tmp10(i),ii),u(j));
        %�0�2��������ָ��
        tmp40=feval(TransF1,ii,x(tmp10(i),ii),u(j)); %�0�2��һ״̬
        tmp50=x(:,ii+1)-tmp40;          %�0�2�ҳ���һ״̬�ځ0�2x�0�2�����λ��
        tmp60=find(tmp50==0);
        if ~isempty(tmp60)
            if nargin<5
                tmp00=tmp00+f_opt(tmp60(1),ii+1); %�0�2set�0�2the�0�2default�0�2object�0�2value
            else
                tmp00=feval(ObjF1,tmp00,f_opt(tmp60(1),ii+1));
            end %��ǰ״̬������ָ��
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