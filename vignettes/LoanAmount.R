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
LoanData$Class<- LendingClubData::SetClass(LoanData$loan_status)
LoanData<- LoanData[-which(is.na(LoanData$loan_amnt)),]

## ------------------------------------------------------------------------
g<- ggplot(LoanData)
g<- g + aes(loan_amnt, group=grade, colour=grade)
g<- g + geom_density(size= 1)
g<- g + labs(title= "Distribution of loan amount by grades",
             x= "Loan Amount")
g<- g + theme_LC()
g

## ---- fig.height=6-------------------------------------------------------
g<- ggplot(LoanData)
g<- g + aes(loan_amnt, group=Class, colour=Class)
g<- g + geom_density(size=.75)
g<- g + labs(x= "Loan Amount")
g<- g + facet_grid(grade~.)
g<- g + theme_LC()
g<- g + labs(title= "Distribution of loan amount by default status")
g

## ---- fig.height=6-------------------------------------------------------
g<- ggplot(LoanData)
g<- g + aes(loan_amnt, group=Class, colour=Class)
g<- g + geom_density(size=.75)
g<- g + labs(x= "Loan Amount")
g<- g + facet_grid(format(LoanData[,"issue_d"],'%Y')~.)
g<- g + theme_LC()
g<- g + labs(title= "Distribution of loan amount by vintage")
g

