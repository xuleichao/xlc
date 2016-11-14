a=int(input('please input a number'))

b=len(str(a))#get the length of the number
sum=0

str_a=str(a)
for i in range(1,b+1):
    sum=sum+(int(str_a[i-1])**b)

if a==sum:
    print('IS armstrong')
else:
    print('NOT armstrong')

    
