SUBROUTINE STS.ValSavingsAc
*------------------------------------------------------------------
* Validation routine opening for savigs accounts
*-------------------------------------------------------------------
    $INSERT T24.BP I_COMMON
    $INSERT T24.BP I_EQUATE

    IF NOT(COMI MATCHES "'6'3N") THEN ETEXT = 'AC-CATEG.NOT.SAVINGS'

    RETURN
END