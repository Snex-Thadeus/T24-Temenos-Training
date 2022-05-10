SUBROUTINE STS.EnqConvFTDebitAmount
*------------------------------------------------------------------
* Conversion routine to remove currency code from FT>AMOUNT.DEBITED
*-------------------------------------------------------------------
    $INSERT T24.BP I_COMMON
    $INSERT T24.BP I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.FUNDS.TRANSFER

    debit_currency = R.RECORD<FT.DEBIT.CURRENCY>
    O.DATA = CHANGE(O.DATA, debit_currency, '')

    RETURN
END