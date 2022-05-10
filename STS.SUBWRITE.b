     SUBROUTINE STS.SUBWRITE
    * ------------------------------------------------------------------------------------
    * A Subroutine to change the ACCOUNT OFFICER from 3 to 4 for all customers
    * Developer : Thadeus
    * Date : 10/05/2022
    * Version : 0.0.1
    * -----------------------------------------------------------------------------------

     $INSERT T24.BP I_COMMON
     $INSERT T24.BP I_EQUATE
     $INSERT T24.BP I_F.CUSTOMER


     GOSUB INIT
     GOSUB PROCESSRECORD

     RETURN

INIT:
     fn_cust  = 'FBNK.CUSTOMER' ; f_cust = ''; cust_rec = ''
     CALL OPF(fn_cust, f_cust)
    *Get the count of all customers*
     SEL.CMD = 'SELECT ': fn_cust
     CUS.LIST = ''
     NO.OF.REC = ''
     RET.CODE = ''

    PROCESSRECORD:

     CALL EB.READLIST(SEL.CMD,CUS.LIST,'',NO.OF.REC,RET.CODE)
     FOR COUNTER = 1 TO NO.OF.REC
    * Extract first record from the Customer list
        cus_id = CUS.LIST<COUNTER>
        CALL F.READ(fn_cust,cus_id,cust_rec,f_cust,err1)
        account_officer_old = cust_rect<EB.CUS.ACCOUNT.OFFICER>

        IF account_officer_old = 3 THEN
           account_officer_new = 4
           cust_rect<EB.CUS.ACCOUNT.OFFICER> = account_officer_new
           CALL F.WRITE(fn_cust,cus_id,cust_rec)
           PRINT 'RECORDS FOR CUSTOMER ': cus_id: 'UPDATED FROM ': account_officer_old: ' TO ': account_officer_new
           CALL JOURNAL.UPDATE(cus_id)
        END
     NEXT COUNTER
     RETURN 
     END

