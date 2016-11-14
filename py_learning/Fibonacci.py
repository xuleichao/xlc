a=int(input('please input the number of Fibonacci'))

Fibonacci_1=0
Fibonacci_2=1
count=3

if a<=0:
    print('please input a positive number')
elif a==1:
    print('The {0} Fibonacci sequece is {1}'.format(a,Fibonacci_1))
else:
    print('Fibonacci is ')
    print(Fibonacci_1,Fibonacci_2)
    while count<=a:
        Fibonacci_n=Fibonacci_1+Fibonacci_2
        print(Fibonacci_n)

        #update the var
        Fibonacci_1=Fibonacci_2
        Fibonacci_2=Fibonacci_n
        count+=1
