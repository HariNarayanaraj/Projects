def header():
    print("=====================================")
    print("collage of India")
    print("=====================================")


header()


def option():
    print("Choose your Option")
    print("1.Add new Student")
    print("2.show student Data")
    print("3.Search Student")
    print("4.Delete Student")
    print("5.Exit")


option()


def inputData():
    userAction = input("Type your option :")
    print("you have selected option =", userAction)


inputData()


def addstudentdata():
    header()
    print("ADD NEW STUDENT DATA")
    print("Enter student NAME")
    name = input()
    print("Enter student AGE :")
    age = input()
    print("Enter student Phone Number :")
    phone = input()
    insertUser(name, age, phone)


addstudentdata()


def searchFromUser():
    header()
    print("Search STUDENT DATA")
    print("Enter student NAME :")
    searchname = input()
    searchUser(searchname)
