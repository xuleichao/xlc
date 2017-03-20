tic;
load data
load textdata
index={};%一条树枝
index_sum=cell(1000,11);pin=1;%决策树列表index_sum,列表指针pin
pro=[1,1,1,1,1];%记录已经计算过的属性增益
gain_com=zeros(5,1);
data=data;
textdata=textdata;
[index_sum,pin]=main(data,textdata,index,pro,index_sum,pin,gain_com);