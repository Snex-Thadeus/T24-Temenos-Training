SUBROUTINE STS.FTInputSameCurr
*------------------------------------------------------------------
* Input routine for FT currencies
*-------------------------------------------------------------------
    $INSERT T24.BP I_COMMON
    $INSERT T24.BP I_EQUATE
    $INSERT T24.BP I_F.FUNDS.TRANSFER

    IF R.NEW(FT.DEBIT.CURRENCY) NE R.NEW(FT.CREDIT.CURRENCY) THEN
        AF = FT.CREDIT.CURRENCY
        ETEXT = "Debit and Credit currencies are not the same"
        CALL STORE.END.ERROR
    END

    RETURN
END