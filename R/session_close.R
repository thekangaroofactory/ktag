

session_close <- function(session){

  # -- log session end
  session$onSessionEnded(function(){
    ktag(who = session$token, what = "close_session")
  })

}
