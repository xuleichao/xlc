function  [index_sum,pin]=main(data,textdata,index,pro,index_sum,pin,gain_com)
pro=pro;
index=index;
index_sum=index_sum;pin=pin;
data=data;
textdata=textdata;
gain_com=gain_com;
global EntD1;
EntD1=EntD(data,textdata,1);
gain_com(1)=pro(1)*gain_month(data,textdata);
[gain_com(2),T]=gain_num(data,textdata,2);
gain_com(2)=pro(2)*gain_com(2);
[gain_com(3),T]=gain_num(data,textdata,3);
gain_com(3)=pro(3)*gain_com(3);
gain_com(4)=pro(4)*gain_tex(textdata,6);
gain_com(5)=pro(5)*gain_tex(textdata,7);
gain_com
if gain_com==0
    index=[index,textdata(2,8)];
else
best=find(gain_com==max(gain_com));
best=best(1)
%best=1;
if best==1
    pro(1)=0;
    index=[index,'月份'];
    A=data(:,1);
    A_num=size(A);
    A_num=A_num(1);
    elet=unique(A);
    elet_num=size(elet);
    elet_num=elet_num(1);
    D_v=zeros(A_num,elet_num);
    for proy=1:elet_num
        count=1;
        for e=1:A_num
            if A(e)==elet(proy)
                D_v(count,proy)=e;
                count=count+1;
            end
        end
    end
    
    for elet_v=1:elet_num
        index_=index;
        data_elet=D_v(:,elet_v);
        data_elet(find(data_elet==0))=[];
        num=size(data_elet);
        num=num(1);
        data_=zeros(num,3);
        textdata_=cell(num+1,8);
        for elet_i=1:num
            elet_num=data_elet(elet_i);
            data_(elet_i,:)=data(elet_num,:);
            textdata_(elet_i+1,:)=textdata(elet_num+1,:);
            textdata_{1,1}='日期';textdata_{1,2}='月份';textdata_{1,3}='最高气温';
            textdata_{1,4}='最低气温';textdata_{1,5}='天气';textdata_{1,6}='风向';
            textdata_{1,7}='风力';textdata_{1,8}='霾吗';
        end
        check=textdata_(:,8);
        num_=size(check);
        num_=num_(1);
        check=unique(check(2:num_));
        size_check=size(check);
        if (size_check(1)==1)
            index_=[index_,num2str(data_(1,1))];
            index_=[index_,check(1)];
            sizeof=size(index_);
            sizeof=sizeof(2);
            for m=1:sizeof
                index_sum(pin,m)=index_(m);
            end
            pin=pin+1;
            
        elseif (isempty(check))
            return
        else
            index_=[index,num2str(data_(1,1))];
            %index=index_;
            gain_com=pro'.*gain_com;
            [index_sum,pin]=main(data_,textdata_,index_,pro,index_sum,pin,gain_com);
            
        end
    end
elseif best==2 | best==3
    col=best;
    pro(col)=0;
    index=[index,textdata(1,best+1)];
    [gain,T]=gain_num(data,textdata,col);
    A=data(:,col);
    A_num=size(A);
    A_num=A_num(1);
    D_v=zeros(A_num,2);
        count=1;
        for e=1:A_num
            
            if A(e)<T
                D_v(count,1)=e;
                count=count+1;
            else
                D_v(count,2)=e;
                count=count+1;
            end
        end
        
    for elet_v=1:2
        index_=index;
        data_elet=D_v(:,elet_v);
        data_elet(find(data_elet==0))=[];
        num=size(data_elet);
        num=num(1);
        data_=zeros(num,3);
        textdata_=cell(num+1,8);
        for elet_i=1:num
            elet_num=data_elet(elet_i);
            data_(elet_i,:)=data(elet_num,:);
            textdata_(elet_i+1,:)=textdata(elet_num+1,:);
            textdata_{1,1}='日期';textdata_{1,2}='月份';textdata_{1,3}='最高气温';
            textdata_{1,4}='最低气温';textdata_{1,5}='天气';textdata_{1,6}='风向';
            textdata_{1,7}='风力';textdata_{1,8}='霾吗';
        end
        data_;
        textdata_;
        check=textdata_(:,8);
        check=unique(check(2:num+1));
        size_check=size(check);
        size_check(1);
        if (size_check(1)==1)
            T_=num2str(T);
            if (data_(1,col)<T)
                operate='<';
                index_=[index_,strcat(operate,T_)];
                index_=[index_,check(1)];
                sizeof=size(index_);
                sizeof=sizeof(2);
                for m=1:sizeof
                    index_sum(pin,m)=index_(m);
                end
                pin=pin+1;
                
            else
                operate='>';
                index_=[index_,strcat(operate,T_)];
                index_=[index_,check(1)];
                sizeof=size(index_);
                sizeof=sizeof(2);
                for m=1:sizeof
                    index_sum(pin,m)=index_(m);
                end
                pin=pin+1;
                
            end
        elseif (isempty(check))
            return
        else
            T_=num2str(T);
            if (elet_v==1)
                operate='<';
                index_=[index_,strcat(operate,T_)];
                gain_com=pro'.*gain_com;
                [index_sum,pin]=main(data_,textdata_,index_,pro,index_sum,pin,gain_com);
                
            else
                operate='>';
                index_=[index_,strcat(operate,T_)];
                gain_com=pro'.*gain_com;
                [index_sum,pin]=main(data_,textdata_,index_,pro,index_sum,pin,gain_com);
                
            end
        end
    end
else
    col=best+2;
    pro(best)=0;
    index=[index,textdata(1,col)];
    A=textdata(:,col);
    A_num=size(A);
    A_num=A_num(1);
    elet=unique(A(2:A_num));
    elet_num=size(elet);
    elet_num=elet_num(1);
    D_v=zeros(A_num,elet_num);
    for proy=1:elet_num
        count=1;
        for e=2:A_num
            if (strcmp(A(e),elet(proy)))
                D_v(count,proy)=e;
                count=count+1;
            end
        end
    end
    
    for elet_v=1:elet_num
        index_=index;
        data_elet=D_v(:,elet_v);
        data_elet(find(data_elet==0))=[];
        num=size(data_elet);
        num=num(1);
        data_=zeros(num,3);
        textdata_=cell(num+1,8);
        for elet_i=2:num+1
            elet_num=data_elet(elet_i-1);
            data_(elet_i-1,:)=data(elet_num-1,:);
            textdata_(elet_i,:)=textdata(elet_num,:);
            textdata_{1,1}='日期';textdata_{1,2}='月份';textdata_{1,3}='最高气温';
            textdata_{1,4}='最低气温';textdata_{1,5}='天气';textdata_{1,6}='风向';
            textdata_{1,7}='风力';textdata_{1,8}='霾吗';
        end
        textdata_;
        check=textdata_(:,8);
        check=unique(check(2:num+1));
        size_check=size(check);
        if (size_check(1)==1)
            index_=[index_,textdata_(2,col)];
            index_=[index_,check(1)];
            sizeof=size(index_);
            sizeof=sizeof(2);
            for m=1:sizeof
                index_sum(pin,m)=index_(m);
            end
            pin=pin+1;
        elseif (isempty(check))
            return
        else
            textdata_(2,col);
            index_=[index_,textdata_(2,col)];
            gain_com=pro'.*gain_com;
            [index_sum,pin]=main(data_,textdata_,index_,pro,index_sum,pin,gain_com);
            
        end
    end
end
end