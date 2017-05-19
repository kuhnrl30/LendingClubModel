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
LoanData %>%
    group_by(grade) %>%
    summarize(Total= n()) %>%
    mutate(Proportion= Total/sum(Total)) %>%
    knitr::kable(align=c('l','r','r'),
                 digits=c(0,0,2),
                 caption= "Distribution by Loan Grade",
                 format.args = list(big.mark=','),
                 col.names = c("Grade","Total","Proportion"))

## ---- fig.align='right', fig.show='hold', fig.align='center', class.output='aligns'----
ggplot(LoanData) +
    aes(x= factor(grade)) +
    geom_histogram(stat="count") +
    labs(x= "Loan Grade") +
    theme_LC()

## ------------------------------------------------------------------------
LoanData %>%
    mutate(Year= format(issue_d,"%Y")) %>%
    group_by(Year) %>%
    summarise(N=n()) %>%
    knitr::kable(format.args = list(big.mark=","),
                 align=c("l","r"),
                 col.names=c("Year","Count"))

## ------------------------------------------------------------------------
LoanData %>%
    mutate(Year= format(issue_d,"%Y")) %>%
    group_by(Year, grade) %>%
    summarize(N=n()) %>%
    mutate(share= round(N/sum(N),2)) %>%
    select(-N) %>%
    spread(key=Year, value=share) %>%
    knitr::kable(forate.args= list(big.mark=","),
                 caption= "Distribution by Loan Grade and Year",
                 align= c("l","r","r","r","r","r","r","r","r","r","r"))

