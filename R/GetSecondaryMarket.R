#' Download loans in secondary market
#'
#' Download the loans currently listed on the secondary market
#' @export

GetSecondaryMarket<- function(){
    CheckSession()

    downloadURL<- "https://resources.lendingclub.com/SecondaryMarketAllNotes.csv"

    ResultsTxt<- getURL(downloadURL)

    dat<-read.csv(textConnection(ResultsTxt),
                  quote="\"'")

    names(dat)<- gsub("[[:punct:]]","",names(dat))

    CleanSecondary(dat)

    }
