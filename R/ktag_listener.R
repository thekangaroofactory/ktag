

#' Observe Event on Tag
#'
#' @param session the session object from the server
#' @param input the input object
#'
#' @returns an observer
#' @export
#'
#' @importFrom shiny observeEvent
#'
#' @examples
#' \dontrun{
#' ktag_listener(session)
#' }

ktag_listener <- function(input, session){

  shiny::observeEvent(input$ktag_event,
                      ktag(when = input$ktag_event$when, what = input$ktag_event$what, who = session$token))

}
