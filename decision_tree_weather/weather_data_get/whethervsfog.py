#!/usr/bin/env python 
# -*- coding: utf-8 -*-

import re
import time
import urllib

def getsource(location,time):
    url="http://lishi.tianqi.com/" +location+'/'+str(time)+'.html'
    source=urllib.urlopen(url)
    html=source.read()

    reg_first=re.compile(r'<li><a href=\"http://beijing\.tianqi\.com/\d\d\d\d\d\d\d\d\.html\">(.*?)</a></li>',re.S)
    #reg_second=re.compile(r'<li>(.*?)</li>')
    infor_1=re.findall(reg_first,html)
    #infor_2=re.findall(reg_second,infor_1[0])
    return(infor_1)
#infor=getsource('beijing',201204)

for time in range(0,2):
    infor=getsource("beijing",201701+time)
    fo=open('whether_time.txt','a')
    for i in infor:
        print i.decode('GBK')
        fo.write(i+'\n')
    fo.close()

    


