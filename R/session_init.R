

session_init <- function(session){

  ktag(who = session$token, what = "init_session", how = session$clientData$url_search)

}
