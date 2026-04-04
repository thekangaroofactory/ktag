

#' Start Recording
#'
#' @description
#' Gateway function to setup & init event recording in a single call.
#'
#' @param session the session object of the Shiny server function
#'
#' @details
#' `session` is required to seteup the event listener, register the onSessionEnded callback,
#' get the URLcquery string & use the token value as a session uuid.
#'
#' @returns an observer reference class object (see shiny::observeEvent())
#' @export
#'
#' @examples
#' \dontrun{
#' ktag::record()
#' }

record <- function(session = shiny::getDefaultReactiveDomain()){

  # -- log session start
  ktag(who = session$token, what = "init_session", how = shiny::isolate(session$clientData$url_search))

  # -- add onSessionEnded callback
  register_close(session)

  # -- insert JavaScript in UI header
  # JS file under inst/assets/js/ktag.js
  insert_js()

  # -- create event listener (& return)
  ktag_listener(session)

}
