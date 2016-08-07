#' Check for html session
#'
#' Check the environment that an html session has been started.

CheckSession<- function(){
    if (!exists("PAGE_SESSION", envir= .GlobalEnv)){
        stop("Please open a html session with OpenSession()",
             call.= FALSE)
    }
}
