function [gain]=gain_tex(textdata,a)
global EntD1;
tex=textdata(:,a);
elet=unique(tex);
len_elet=size(elet);
len_tex=size(tex);
len_tex=len_tex(1);
len_elet=len_elet(1);
tex_0=0;
tex_1=0;
judge=zeros(12,2);
Ent_mu=zeros(12,1);
for i=1:len_elet
tex_0=0;
tex_1=0;
    for j=2:len_tex
        if(strcmp(tex(j),elet(i)))
            if (textdata{j,8}=='0')
                tex_0=tex_0+1;
            else
                tex_1=tex_1+1;
            end
        end
    end
    judge(i,1)=tex_0;
    judge(i,2)=tex_1;
    if (judge(i,1)~=0)&(judge(i,2)~=0)
    Ent_mu(i)=-(((judge(i,1)/(judge(i,1)+judge(i,2)))*log2(judge(i,1)/(judge(i,1)+judge(i,2)))+(judge(i,2)/(judge(i,1)+judge(i,2)))*log2(judge(i,2)/(judge(i,1)+judge(i,2)))));
    else
    Ent_mu(i)=0;
    end
end
Ent_=zeros(12,1);
%EntD=EntD(textdata,textdata,a)
%EntD= 0.5154;

for k=1:12
    Ent_(k)=((judge(k,1)+judge(k,2))/(len_tex-1))*Ent_mu(k);
end
gain=EntD1-sum(Ent_);