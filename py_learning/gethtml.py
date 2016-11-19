#_*_ coding: utf-8_*_
import urllib
import re

def gethtml(url):
    page=urllib.urlopen(url)
    html=page.read()
    return html

def get(html):
    reg=u'<div>(.*?)</div>'
    crawl_re=re.compile(reg,re.S)
    result_list=re.findall(crawl_re,html)
    return result_list

html=gethtml('http://blog.leanote.com/cate/qq-alan/python')
html=html.decode('utf8')

#if __name__ == '__main__':
a=get(html)
aa=a[0].replace('\t','')
print(aa)
