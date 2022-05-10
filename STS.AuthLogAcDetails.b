SUBROUTINE STS.AuthLogAcDetails
*------------------------------------------------------------------
* Authorization routine to log account details
*-------------------------------------------------------------------
    $INSERT T24.BP I_COMMON
    $INSERT T24.BP I_EQUATE
    $INSERT T24.BP I_F.ACCOUNT

    log_file = ID.NEW : '.log'
    log_info = R.NEW(AC.MNEMONIC) : '*' : R.NEW(AC.SHORT.TITLE): '*' : R.NEW(AC.CURRENCY)
    log_info := '*' : R.NEW(AC.CATEGORY) : '*' : OPERATOR

    CALL STS.Logger(log_file, log_info, 'INFO', ret_code)

    RETURN
END