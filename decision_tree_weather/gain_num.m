function [gain_max,T]=gain_num(data,textdata,a)

A=data(:,a);                        %需要运算的数据
global EntD1;
len_A=size(A);
len_A=len_A(1);                     %数据长度
sort_A=sort(unique(A));             %数据去重，排序
num_sort_A=size(sort_A);
num_sort_A=num_sort_A(1);           %不同值的个数
T_a=zeros(num_sort_A-1,1);
Ent_=zeros(num_sort_A-1,1);
gain=zeros(num_sort_A-1,1);
if (num_sort_A==1)
    gain=zeros(1);
    T_a=zeros(1);
    T_a(1)=A(1);
else
for i=1:(num_sort_A-1)
    A_left_mai=0;
    A_left_feimai=0;
    A_right_mai=0;
    A_right_feimai=0;
    Ent_left=0;
    Ent_right=0;
    T_a(i)=(sort_A(i)+sort_A(i+1))*0.5;%得出划分点
    for j=1:len_A
        if (A(j)<T_a(i))
            if (textdata{j+1,8}=='1')
               A_left_mai=A_left_mai+1;
            else
               A_left_feimai=A_left_feimai+1;
            end
            A_left=A_left_mai+A_left_feimai;
            if(A_left_mai~=0)&(A_left_feimai~=0)
                Ent_left=-((A_left_mai/A_left)*log2(A_left_mai/A_left)+(A_left_feimai/A_left)*log2(A_left_feimai/A_left));
            else
                Ent_left=0;
            end
        else
            if (textdata{j+1,8}=='1')
               A_right_mai=A_right_mai+1;
            else
               A_right_feimai=A_right_feimai+1;
            end
            A_right=A_right_mai+A_right_feimai;
            if(A_right_mai~=0)&(A_right_feimai~=0)
                Ent_right=-((A_right_mai/A_right)*log2(A_right_mai/A_right)+(A_right_feimai/A_right)*log2(A_right_feimai/A_right));
            else
                Ent_right=0;
            end
        end   
    end
    Ent_(i)= ((A_left_mai+A_left_feimai)/len_A)*Ent_left+((A_right_mai+A_right_feimai)/len_A)*Ent_right;
    gain(i)=EntD1-Ent_(i);
end
end
gain_max=max(gain);
T=T_a(find(gain==gain_max));



