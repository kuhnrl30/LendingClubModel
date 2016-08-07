#' Clean Secondary Download data
#'
#' Clean the download dataset so the columns are in the appropriate data types
#'

CleanSecondary<-function(x){
    x$DateTimeListed<- as.Date(x$DateTimeListed,format="%m/%e/%Y")
    x$YTM<- as.character(x$YTM)
    x
}
