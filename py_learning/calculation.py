def plus(a,b):
    return a+b

def subtract(a,b):
    return a-b

def multiply(a,b):
    return a*b

def divide(a,b):
    return a/b

num1=float(input("please input the first one"))
num2=float(input("please input the second one"))

print("which is your need")
print("  add:    input 1")
print("subtract: input 2")
print("multiply: input 3")
print("divide:   input 4")

a=int(input("please input your need:1 2 3 or 4"))

if a==1:
    print '%f+%f=%f'%(num1,num2,plus(num1,num2))
elif a==2:
    print num1,"-",num2,"=",substract(num1,num2)
elif a==3:
    print num1,"*",num2,"=",multiply(num1,num2)
elif a==4:
    print num1,"/",num2,"=",divide(num1,num2)
else:
    print("shit")
    
