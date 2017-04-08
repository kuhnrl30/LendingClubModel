## ---- echo=F-------------------------------------------------------------
options(scipen = 6)
knitr::opts_chunk$set(cache=FALSE, fig.height=3, fig.width = 7, comment=NULL, eval=T, tidy=F, width=80, message= FALSE, echo= FALSE, warning = FALSE)

## ----preamble, echo=FALSE------------------------------------------------
library(dplyr)
library(LendingClubData)
library(LendingClubModel)
library(ggplot2)
library(scales)
LoanData<- LendingClubData::IssuedLoans()
LoanData$Class<- SetClass(LoanData$loan_status)
LoanData<- LoanData[-which(is.na(LoanData$loan_amnt)),]

## ------------------------------------------------------------------------
LoanData[which(LoanData$dti>50),"dti"]<- 50

a<- ggplot(LoanData)
a<- a + aes(dti, group=Class, colour=Class)
a<- a + geom_density()
a<- a + labs(title="Distribution of DTI by default status")
a<- a + theme_LC()
a

## ---- fig.height=6-------------------------------------------------------
b<- LoanData %>%
    group_by(grade, Class) %>%
    summarize(write_mean= mean(dti))

a<- ggplot(LoanData)
a<- a + aes(dti, group=Class, colour=Class)
a<- a + facet_grid(grade~.)
a<- a + geom_density()
a<- a + geom_vline(aes(xintercept=write_mean),data=b)
a<- a + labs(title="Distribution of DTI by default status")
a<- a + theme_LC()
a

