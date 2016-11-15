def fibo(n):
    if n<=1:
        return(n)
    else:
        return(fibo(n-1)+fibo(n-2))

num=int(input("How many fibo do you want?"))

if num<=0:
    print("input a positive number")
else:
    print 'The fibonaqie are: '
    for i in range(1,num+1):
        print fibo(i),
        
