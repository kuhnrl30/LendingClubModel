load_it<- function(){
    x- LendingClubData::IssuedLoans(2007:2017)
    x$Class<- LendingClubData::SetClass(x$loan_status)
    x<- x[!is.na(x$loan_amnt),]
    x<- x %>% filter(policy_code==1) %>% select(-policy_code)
    x
    }

switch(menu(c("Yes","No"), title="Do you want to load data?"),
       LoanData<- load_it(),
       cat("Phew, that takes too long anyway"))

# LoanData<- LendingClubData::IssuedLoans(2007:2017)
# LoanData$Class<- LendingClubData::SetClass(LoanData$loan_status)
# LoanData<- LoanData[!is.na(LoanData$loan_amnt),]
# LoadData<- LoanData %>% filter(policy_code==1) %>% select(-policy_code)