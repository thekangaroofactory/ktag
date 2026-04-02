

#' Observe Event on Tag
#'
#' @param session the session object from the server
#'
#' @returns an observer
#' @export
#'
#' @examples
#' \dontrun{
#' ktag_listener(session)
#' }

ktag_listener <- function(session){

  observeEvent(input$ktag_event,
               ktag(when = input$ktag_event$when, what = input$ktag_event$what, who = session$token))

}
