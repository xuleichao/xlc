function [gain]=gain_month(data,textdata)
global EntD1;
month=data(:,1);
elet=unique(month);
len_elet=size(elet);
len_month=size(month);
len_month=len_month(1);
len_elet=len_elet(1);
month_0=0;
month_1=0;
judge=zeros(12,2);
Ent_mu=zeros(12,1);
for i=1:len_elet
month_0=0;
month_1=0;
    for j=1:len_month
        if(month(j)==elet(i))
            if (textdata{j+1,8}=='0')
                month_0=month_0+1;
            else
                month_1=month_1+1;
            end
        end
    end
    judge(i,1)=month_0;
    judge(i,2)=month_1;
    if (judge(i,1)~=0)&(judge(i,2)~=0)
    Ent_mu(i)=-(((judge(i,1)/(judge(i,1)+judge(i,2)))*log2(judge(i,1)/(judge(i,1)+judge(i,2)))+(judge(i,2)/(judge(i,1)+judge(i,2)))*log2(judge(i,2)/(judge(i,1)+judge(i,2)))));
    else
    Ent_mu(i)=0;
    end
end
Ent_=zeros(12,1);
%EntD=EntD(data,textdata,1)
%EntD= 0.5154;

for k=1:12
    Ent_(k)=((judge(k,1)+judge(k,2))/len_month)*Ent_mu(k);
end
gain=EntD1-sum(Ent_);