def newuser():
    name=raw_input('please input your new name')
    if name in allname['name']:
        print'the name has been used'
    else:
        passwords=raw_input('you need a password to login')
        allname['name'].append(name)
        allname['passwords'].append(passwords)
    return allname
def olduser():
    oldname=raw_input('input your name')
    if oldname not in allname['name']:
        print'your input is wrong'
    else:
        password=raw_input('input your password')
        nameindex=allname['name'].index(oldname)
        realpw=allname['passwords'][nameindex]
        if password==realpw:
            print'welcome you'
        else:
            print'wrong you shit'
def login():
    option=raw_input('what do you wanna to do.\nN(be a new user\nO(login))')
    if option=='N':
        newuser()
    elif option=='O':
        olduser()
    else:
        print'nong sha lei'
if __name__=='__main__':
    allname={'name':['xuleichao'],'passwords':['123']}
    login()
