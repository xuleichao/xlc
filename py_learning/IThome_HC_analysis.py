# -*- coding:gb2312 -*-

import re
import time
import urllib

def getHC(page):        #'HC=hot comments'
    url="http://www.ithome.com/comment/"+str(page)
    source=urllib.urlopen(url)
    html=source.read()

    reg_location=re.compile(r'class=\"posandtime\">(.*?)\&.*?</span></div><p>',re.S)
    reg_name=re.compile('href=\"http://quan\.ithome\.com/user/.*?\">(.*?)</a></strong><span',re.S)
    reg_head_url=re.compile('<img class=\"headerimage\" onerror=\"this\.src=.*?\" src=\"(.*?)\"/>',re.S)
    reg_suport=re.compile('id=\"hotagree.*?\" href=\"javascript:hotCommentVote.*?\">(.*?)<',re.S)
    reg_device=re.compile('href=\"http://m\.ithome\.com/ithome/download/\">(.*?)<',re.S)

    location=re.findall(reg_location,html)
    #name=re.findall(reg_name,html)
    #head_url=re.findall(reg_head_url,html)
    #suport=re.findall(reg_suport,html)
    #device=re.findall(reg_device,html)
    '''for a in location:
        print a
    for b in name:
        print b
    for c in head_url:
        print c
    for d in suport:
        print d
    for e in device:
        print e'''
    return(location)
    
if __name__=='__main__':
    for i in range(220229+1,275122):
        location=getHC(i)
        print i

        fo=open('location.txt','a')
        for i in location:
            fo.write(i+'\n')
        fo.close()
    a=random.randint(0.5,5)
    time.sleep(a)  

   

