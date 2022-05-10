PROGRAM TestProg

    customers = '100434, 111217, 100485, 100289, 100588, 100489'
    CHANGE ',' TO @FM IN customers


    LOOP
        REMOVE cust_id FROM customers SETTING POS
    WHILE cust_id : pos
        CALL STS.CustomerDetails(cust_id, cust_name, cust_residence)

        BEGIN CASE
            CASE cust_residence EQ 'US'
                CRT cust_id: '*': cust_name:'*': cust_residence
            CASE cust_residence EQ 'LU'
                CRT cust_name:' is a resident of Luxembourg'
            CASE cust_residence EQ 'RW'
                CRT cust_id: '-': cust_name:'(': cust_residence :')' 
        END CASE  
    REPEAT

    num_rec = DCOUNT(customers, @FM)

    * FOR i = 1 TO num_rec
    *     cust_id = customers<i>
    *     CALL STS.CustomerDetails(cust_id, cust_name, cust_residence)
    *     IF cust_residence EQ 'US' THEN
    *         CRT cust_id: '*': cust_name:'*': cust_residence
    *     END ELSE IF cust_residence EQ 'LU' THEN
    *         CRT cust_name:' is a resident of Luxembourg'
    *     END ELSE
    *         CRT cust_id: '-': cust_name:'(': cust_residence :')'
    *     END    
    * NEXT i

    FOR i = 1 TO num_rec
        cust_id = customers<i>
        CALL STS.CustomerDetails(cust_id, cust_name, cust_residence)

        BEGIN CASE
            CASE cust_residence EQ 'US'
                CRT cust_id: '*': cust_name:'*': cust_residence
            CASE cust_residence EQ 'LU'
                CRT cust_name:' is a resident of Luxembourg'
            CASE cust_residence EQ 'RW'
                CRT cust_id: '-': cust_name:'(': cust_residence :')' 
        END CASE  
    NEXT i
END