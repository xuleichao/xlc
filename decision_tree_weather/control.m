tic;
load data
load textdata
index={};%һ����֦
index_sum=cell(1000,11);pin=1;%�������б�index_sum,�б�ָ��pin
pro=[1,1,1,1,1];%��¼�Ѿ����������������
gain_com=zeros(5,1);
data=data;
textdata=textdata;
[index_sum,pin]=main(data,textdata,index,pro,index_sum,pin,gain_com);