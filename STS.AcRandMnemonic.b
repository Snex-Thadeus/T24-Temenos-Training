    SUBROUTINE STS.AcRandMnemonic
*------------------------------------------------------------------
* Auto New content Routine to populaite AC>MNEMONIC with 
* randomly generated value(eg ABCD1234XY)
*-------------------------------------------------------------------
    $INSERT T24.BP I_COMMON
    $INSERT T24.BP I_EQUATE
    $INSERT SNEXS.BP I_STS.COMMON

    rand_mne = RND$Letters(4) : RND$Numbers(4) : RND$Letters(2) ;* ABCD1234XY
    IF R.NEW(AF) EQ '' THEN R.NEW(AF) = rand_mne

    RETURN
END