

#' Start Recording
#'
#' @description
#' Gateway function to setup & init event recording in a single call.
#'
#' @param input the input object of the Shiny server function
#' @param session the session object of the Shiny server function
#'
#' @details
#' `input` is required to create the listener that will capture events sent by
#' the JavaScript code.
#' `session` is required to register the onSessionEnded callback, get the URL
#' query string & use the token value as a session uuid.
#'
#' @returns an observer reference class object (see shiny::observeEvent())
#' @export
#'
#' @examples
#' \dontrun{
#' ktag::record()
#' }

record <- function(input, session){

  # -- log session start
  ktag(who = session$token, what = "init_session", how = session$clientData$url_search)

  # -- add onSessionEnded callback
  register_close(session)

  # -- insert JavaScript in UI header
  # JS file under inst/assets/js/ktag.js
  insert_js()

  # -- create event listener (& return)
  ktag_listener(input, session)

}
