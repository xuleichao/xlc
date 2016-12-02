def sushu(a):

    for i in range(2,int(math.sqrt(a))):
        if a%i==0:
            break
        #return(False)
    
    else:
        return(True)

a=2
count=0
import math
while count<6:
   m=2**a-1
   if sushu(a) and sushu(m):
       print m
       count+=1
    
   a+=1    
   
        
    
