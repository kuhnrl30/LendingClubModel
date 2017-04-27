## ---- echo=F-------------------------------------------------------------
options(scipen = 6)
knitr::opts_chunk$set(cache=FALSE, fig.height=3, fig.width = 7, comment=NULL, eval=T, tidy=F, width=80, message= FALSE, echo= FALSE, warning = FALSE)

## ----preamble, echo=FALSE------------------------------------------------
library(dplyr)
library(LendingClubData)
library(LendingClubModel)
library(ggplot2)
library(scales)
library(tidyr)
LoanData<- LendingClubData::IssuedLoans()
LoanData$Class<- SetClass(LoanData$loan_status)
LoanData<- LoanData[-which(is.na(LoanData$loan_amnt)),]

## ------------------------------------------------------------------------
LoanData %>%
    group_by(grade) %>%
    summarize(Total= n()) %>%
    mutate(Proportion= Total/sum(Total)) %>%
    knitr::kable(align=c('l','r','r'),
                 digits=c(0,0,2),
                 caption= "Distribution by Loan Grade",
                 format.args = list(big.mark=','),
                 col.names = c("Grade","Total","Proportion"))

