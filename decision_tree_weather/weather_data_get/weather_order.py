#!/usr/bin/env python 
# -*- coding: utf-8 -*-

import re
import urllib

def changestr(string):
    reg=re.compile(r'<a href=\"http://beijing.tianqi.com/.*?.html\">(.*?)</a>',re.S)
    result=re.findall(reg,string)
    print result
    return(result)

f=open("whether1.txt")
while True:
    string=f.readline(100)  
    string_2=changestr(string)
    while string_2:
        print string_2
        break
    if not string:
        break
f.close()

