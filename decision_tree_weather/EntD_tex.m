function [y]=EntD_tex(textdata,a)
i=2;
j=0;
k=0;
A=textdata(:,a);
num=size(A);
num_mai=zeros(num(1),1);
num_feimai=zeros(num(1),1);
while(i<=num(1))
    if (textdata{i,8}=='0')
        k=k+1;
        num_feimai(k)=i+1;
    else 
        j=j+1;
        num_mai(j)=i+1;
    end
    i=i+1;
end
y=-((j/(num(1)-1))*log2(j/(num(1)-1))+(k/(num(1)-1))*log2(k/(num(1)-1)));
i
j
k
num(1)
%num_mai(find(num_mai==0))=[]
%num_feimai(find(num_feimai==0))=[]