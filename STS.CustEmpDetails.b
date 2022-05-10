SUBROUTINE STS.CustEmpDetails(cust_id, short_name, street_name, town_country, nationality)
* ------------------------------------------------------
* Subroutine to fetch employment details of a customer 
* @in: cust_id
*@out: short_name, street_name, town_country, nationality
*--------------------------------------------------------
    $INSERT SNEXS.BP I_COMMON
    $INSERT SNEXS.BP I_EQUATE
    $INSERT SNEXS.BP I_F.CUSTOMER 


    fn_cust = 'F.CUSTOMER'
    f_cust = ''
    cust_rec = ''

    short_name = ''
    street_name = ''
    town_country = ''
    nationality = ''

    CALL LOAD.COMPANY('BNK')
    CALL OPF(fn_cust, f_cust)
    CALL F.READ(fn_cust, cust_id, cust_rec, f_cust, err)

    short_name = cust_rec<EB.CUS.SHORT.NAME>
    street_name = cust_rec<EB.CUS.STREET.NAME>
    town_country = cust_rec<EB.CUS.TOWN.COUNTRY>
    nationality = cust_rec<EB.CU.NATIONALITY>





    RETURN
END    