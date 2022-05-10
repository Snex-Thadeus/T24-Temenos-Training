SUBROUTINE CalculateDTI(gross_income, total_debts, dti)

*---------------------------------------------------
*Subroutine to calculate the Debt-to-Income ratio
*---------------------------------------------------


    dti = total_debts/gross_income
    RETURN
END