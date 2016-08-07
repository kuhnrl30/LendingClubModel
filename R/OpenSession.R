#' Open a session with Lending Club
#'
#' @param email login information for Lending Club
#' @param password login information for Lending Club
#' @export


OpenSession<- function(email,password){
    handle<- "https://www.lendingclub.com/account/login.action"
    PAGE_SESSION<<- html_session(handle)

    pgform<- html_form(PAGE_SESSION)[[1]]
    filledform<- set_values(pgform,
                            login_email=email,
                            login_password=password)
    submit_form(PAGE_SESSION,filledform)
}








