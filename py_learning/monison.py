def sushu(a):

    for i in range(2,int(math.sqrt(a))+1):
        if a%i==0:
            return(False)
            break
            
    
    else:
        return(True)

a=1
count=0
import math
while count<6:
   m=2**a-1
   if sushu(a) and sushu(m):
       print m
       count+=1
    
   a+=1    
   
        
    
