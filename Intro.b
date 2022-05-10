    PROGRAM Intro

    name = 'Snex Thadeus'
    company = "velocity software.lt"
    address = \23, Nairobi\
    age = 27
    salary = 4567.98

    CRT "My name is ": name :" I work for ": company
    CRT "I live on ": address

    street = address[5, 12]
    house_no = address[1,2]
    CRT street
    CRT house_no

    CRT @(-1)               ;* clear screen
    *name[5] = 'Kamatali'
    company[-3,1] = ' '
    firstname = LEFT(name, 4)
    CRT "My name is ": name :" I work for ": UPCASE(company)
    CRT "I earn EUR ": salary :" at the age of ": age + 1
    *CRT "Address is of ": LEN(address) :" characters"
    *CRT "My first name is ": firstname
    *CRT "My last name is ": RIGHT(name, 8)
    *CRT STR(firstname, 3)

END