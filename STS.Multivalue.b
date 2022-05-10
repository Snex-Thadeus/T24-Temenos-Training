PROGRAM STS.Multivalue
    CRT @(-1)

    PRINT "Enter the customer Id: "
    INPUT cust_id

    CALL STS.CustEmpDetails(cust_id, short_name, street_name, town_country, nationality)
    CRT "Customer id": cust_id
    CRT "Short Name": FMT(short_name, 'MCP')
    CRT "Street Name": FMT(street_name, 'MCP')
    CRT "Town Country": FMT(town_country, 'MCP')
    CRT "Nationality": FMT(nationality, 'MCP')


END