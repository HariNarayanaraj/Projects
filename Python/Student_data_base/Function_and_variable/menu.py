import database

def header():
    print('*****************')
    print('Chennai University')
    print('*****************')


def homepage():
    print('1.Add Student Name')
    print('2.Delete Student Name')
    print('3.Search Student Details')
    print('4.Show All Details')
    print('5.Exit')


def read_user_action():
    user_action = int(input('Chose your Options:'))
    return user_action


def process():
    user_action = read_user_action()
    if user_action == 1:
        header()
        add_user()

    elif user_action == 2:
        header()
        delete_student_name()

    elif user_action == 3:
        header()
        search_student_name()

    elif user_action == 4:
        header()
        database.show_database()

    elif user_action == 5:
        print('EXIT')
        exit()

    else:
        print('Options Is Wrong')


def add_user():
    student_name = input('Enter Student Name: ')
    student_age = input('Enter Age of the Student: ')
    student_phone = input('Enter Student Phone No: ')
    database.insert_into_database(student_name, student_age, student_phone)


def delete_student_name():
    delete_name = input('Enter the Name to delete Student Details: ')
    database.delete_from_database(delete_name)


def search_student_name():
    search_name = input('ENTER The Student Name: ')
    database.search_from_database(search_name)