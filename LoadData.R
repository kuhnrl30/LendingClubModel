LoanData<- LendingClubData::IssuedLoans(2007:2017)
LoanData$Class<- LendingClubData::SetClass(LoanData$loan_status)
LoanData<- LoanData[!is.na(LoanData$loan_amnt),]
