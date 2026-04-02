

#' Log Session End
#'
#' @param session the session object from the server
#'
#' @export
#'
#' @examples
#' \dontrun{
#' session_close(session)
#' }

session_close <- function(session){

  # -- log session end
  session$onSessionEnded(function(){
    ktag(who = session$token, what = "close_session")
  })

}
