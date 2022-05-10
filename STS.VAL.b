     SUBROUTINE STS.VAL
    * ------------------------------------------------------------------------------------
    * A Validation routine : During FT when the Debit account number is entered,  SVA=17938 CA =43311
    * system should chek if it is a CURRENT account otherwise it should throw an error
    * version use : FUNDS.TRANSFER,MKC.VAL.ROUT
    * Developer : Thadeus
    * Date : 10/05/2022
    * Version : 0.0.1
    * -----------------------------------------------------------------------------------
* PF,I STS.VAL --- EB.API, I STS.VAL  VERSION, FT,SAT.NEW
     $INSERT T24.BP I_COMMON
     $INSERT T24.BP I_EQUATE
     $INSERT T24.BP I_F.ACCOUNT

     GOSUB INIT
     GOSUB PROCESSRECORD

     RETURN

INIT:
     fn_acc  = 'F.ACCOUNT' ; f_acc = ''; acc_rec = ''
     acc_id = ''; category=''

     CALL OPF(fn_acc, f_acc)

     RETURN

    PROCESSRECORD:

     acc_id = COMI

     CALL F.READ(fn_acc, acc_id, acc_rec, f_acc, err)

     category = acc_rec<AC.CATEGORY>
    *  CURRENT AC IS IN  CATEGORY 1001 TO 1999
     IF category LE 1000 OR category GT 1999 THEN
        ETEXT = 'NOT OTHER THAN CURRENT ACCOUNT IS ALLOWED'
        CALL STORE.END.ERROR
     END
     RETURN


