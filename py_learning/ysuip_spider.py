# -*- coding: utf-8 -*-
import re
import urllib

url='http://yit.ysu.edu.cn/info/9351/58213.htm'
#要抓取的网页
source=urllib.urlopen(url)
#获得要抓取网页的地址
html=source.read()
#获得抓取网页的源码/资源

reg_ip=r'<td valign=\"top\"> <p>(.*?) </p></td>'     #网页中IP的正则表达
reg_title=r'<td width=\".*?\"> <p align=\"center\">(.*?) </p></td>' #表头的正则表达
title_reg=re.compile(reg_title)            
ip_reg=re.compile(reg_ip)        #对正则表达进行编译，一般反复使用正则表达的时候编译。
ip_result=re.findall(ip_reg,html) #获得IP，并将结果保存
title_result=re.findall(title_reg,html)#获得表头信息，并将结果保存
length_ip=len(ip_result)
length_ti=len(title_result)           #获得表头和IP列表的长度
result=range(1,length_ip+1)          

for i in range(1,length_ti+1):
    for j in range(1,length_ip+1):
        if (j-1-i+1)%6==0:          #将表头循环加入到IP列表中
            result[j-1]=title_result[i-1]+':'+ip_result[j-1]

for i in result:
    print i

