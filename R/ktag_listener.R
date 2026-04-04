

#' Observe Event on Tag
#'
#' @param session the session object from the server
#'
#' @returns an observer reference class object (see shiny::observeEvent())
#' @export
#'
#' @importFrom shiny observeEvent
#'
#' @examples
#' \dontrun{
#' ktag_listener(session)
#' }

ktag_listener <- function(session = shiny::getDefaultReactiveDomain()){

  shiny::observeEvent(session$input$ktag_event,
                      ktag(when = session$input$ktag_event$when, what = session$input$ktag_event$what, who = session$token))

}
