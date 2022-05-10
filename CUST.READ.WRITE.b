SUBROUTINE CUST.READ.WRITE
*-------------------------------------------------------------
*Write a subroutine that will changes the Account officer from 1 to 2 and display the details 
*(Customer, Mnemonic, Old Acct officer and New Acct officer) for all customers.
*
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_F.CUSTOMER
      GOSUB INIT
      GOSUB OPENFILES
      GOSUB PROCESS
      RETURN
INIT:
      FN.CUS = "FBNK.CUSTOMER"
      F.CUS = "  "
      Y.CUS.ID = ‘’
      Y.NATIONALITY = "  "
      Y.MNEMONIC = "  "
      R.CUSTOMER = " "
      Y.ERR = "  "
      RETURN 

OPENFILES:
      CALL OPF(FN.CUS,F.CUS)
      RETURN
PROCESS: 
        SEL.CMD = ‘SELECT ‘:FN.CUS
      CALL EB.READLIST(SEL.CMD,SEL.LIST,’’,NO.OF.REC,RET.CODE)
      LOOP
      REMOVE Y.CUS.ID FROM SEL.LIST SETTING POS
      WHILE  Y.CUS.ID:POS
      CALL F.READ(FN.CUS, Y.CUS.ID , R.CUSTOMER , F.CUS , Y.ERR)
      Y.OLD.ACCT.OFFICER = R.CUSTOMER<EB.CUS.ACCOUNT.OFFICER>

      IF Y.OLD.ACCT.OFFICER EQ ‘1’ THEN 
	  Y.NEW.ACCT.OFFICER = ‘2’
	  R.CUSTOMER<EB.CUS.ACCOUNT.OFFICER> = Y.NEW.ACCT.OFFICER
      END
	  Y.DET = Y.CUS.ID:’ * ‘:Y.MNEMONIC:’ * ‘:Y.OLD.ACCT.OFFICER:’ * ‘: Y.NEW.ACCT.OFFICER
      PRINT Y.DET
      REPEAT
      RETURN
END