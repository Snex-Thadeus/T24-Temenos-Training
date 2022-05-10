     SUBROUTINE STS.INPTRTN
    * ------------------------------------------------------------------------------------
    * A INPUT routine : During FT commit, when the Debit account is other than CURRENT AC,
    * system should throw an error "NO OTHER THAN CURRENT ACCOUNT IS ALLOWED"
    * version use : FUNDS.TRANSFER,MKC.VAL.ROUT
    * Developer : Thadeus
    * Date : 10/05/2022
    * Version : 0.0.1
    * -----------------------------------------------------------------------------------
* PF,I STS.INPTRTN --- EB.API, I STS.INPTRTN  VERSION, I FUNDS.TRANSFER,MKC.VAL.ROUT -- 64.1
     $INSERT T24.BP I_COMMON
     $INSERT T24.BP I_EQUATE
     $INSERT T24.BP I_F.FUNDS.TRANSFER

     GOSUB INIT
     GOSUB PROCESSRECORD

     RETURN

INIT:
     fn_acc  = 'F.ACCOUNT' ; f_acc = ''; acc_rec = ''
     acc_id = ''; category=''

     CALL OPF(fn_acc, f_acc)

     RETURN

    PROCESSRECORD:
    *  acc_id = COMI
    * R.NEW Is a common variable defined in I_COMMON, Dimensioned array, holds the currently opened record
    acc_id = R.NEW(FT.DEBIT.ACCT.NO)
    DEBUG

     CALL F.READ(fn_acc, acc_id, acc_rec, f_acc, err)

     category = acc_rec<AC.CATEGORY>
    *  CURRENT AC IS IN  CATEGORY 1001 TO 1999
     IF category LE 1000 OR category GT 1999 THEN
        ETEXT = 'NO OTHER THAN CURRENT ACCOUNT IS ALLOWED FOR DEBIT ACCOUNT'
        CALL STORE.END.ERROR
     END
     RETURN


