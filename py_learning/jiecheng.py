a=int(input("please input a number"))

a_jiecheng=1

if a==0:
    print("a_jiecheng=1")
    
elif a<0:
    print("please input a positive number")

for i in range(1,a+1):
    a_jiecheng=a_jiecheng*i

print("a_jiecheng={0}".format(a_jiecheng))
    

