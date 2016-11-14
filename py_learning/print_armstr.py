a=int(input('input mix'))
b=int(input('input max'))

for i in range(a,b):
    i_len=len(str(i))#get the length of the number
    sum=0
    str_i=str(i)
    for j in range(1,i_len+1):
        sum=sum+(int(str_i[j-1])**i_len)

    if i==sum:
        print(i)

