     SUBROUTINE STS.CUSDELETE
    * ------------------------------------------------------------------------------------
    * A Subroutine to delete a customer
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
     Y.CUSID = ' '
     CALL OPF(fn_cust, f_cust)
    RETURN     

    PROCESSRECORD:
     CALL f.DELETE(fn_cust, Y.CUSID)
     CALL CALL JOURNAL.UPDATE(cus_id)
     RETURN
END

