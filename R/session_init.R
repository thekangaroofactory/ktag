

#' Log Session Start
#'
#' @param session the session object from the server
#'
#' @export
#'
#' @examples
#' \dontrun{
#' session_init(session)
#' }

session_init <- function(session){

  ktag(who = session$token, what = "init_session", how = session$clientData$url_search)

}
