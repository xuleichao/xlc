import re
import urllib

url='http://yit.ysu.edu.cn/info/9351/58213.htm'
source=urllib.urlopen(url)
html=source.read()

reg_ip=r'<td valign=\"top\"> <p>(.*?) </p></td>'
reg_title=r'<td width=\".*?\"> <p align=\"center\">(.*?) </p></td>'
title_reg=re.compile(reg_title)
ip_reg=re.compile(reg_ip)
ip_result=re.findall(ip_reg,html)
title_result=re.findall(title_reg,html)
length_ip=len(ip_result)
length_ti=len(title_result)
result=range(1,length_ip+1)

for i in range(1,length_ti+1):
    for j in range(1,length_ip+1):
        if (j-1-i+1)%6==0:
            result[j-1]=title_result[i-1]+':'+ip_result[j-1]

for i in result:
    print i

