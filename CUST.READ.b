SUBROUTINE CUST.READ
*............................................
*Write a subroutine that will display the details (Id, Mnemonic and Nationality) of a customer whose id  is 100115
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
      Y.CUS.ID = '100115'
      Y.NATIONALITY = "  "
      Y.MNEMONIC = "  "
      R.CUSTOMER = " "
      Y.ERR = "  "
      RETURN

OPENFILES:
      CALL OPF(FN.CUS,F.CUS)
      RETURN
PROCESS:
      CALL F.READ(FN.CUS, Y.CUS.ID , R.CUSTOMER , F.CUS, Y.ERR)
      Y.NATIONALITY = R.CUSTOMER<EB.CUS.NATIONALITY>
      Y.MNEMONIC = R.CUSTOMER<EB.CUS.MNEMONIC>
      PRINT “CUSTOMER ID IS :”:Y.CUS.ID
      PRINT "NATIONALITY IS :":Y.NATIONALITY
      PRINT "MNENOMIC IS :":Y.MNEMONIC
      RETURN
END
