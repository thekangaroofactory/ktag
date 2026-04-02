

ktag_listener <- function(session){

  observeEvent(input$ktag_event,
               ktag(when = input$ktag_event$when, what = input$ktag_event$what, who = session$token))

}
