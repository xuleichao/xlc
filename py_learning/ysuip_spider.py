import re
import urllib

url='http://yit.ysu.edu.cn/info/9351/58213.htm'
source=urllib.urlopen(url)
html=source.read()

reg=r'<td valign=\"top\"> <p>(.*?) </p></td>'
ip_reg=re.compile(reg)
result=re.findall(ip_reg,html)

for i in result:
    i=i+'\n'
    print i

