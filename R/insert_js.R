

#' Insert JavaScript
#'
#' @description
#' Insert the required JavaScript code from Server side
#'
#' @details
#' This function is a wrapper around shiny::insertUI() to add the JavaScript
#' from Server side. This way, no use_* call is needed in the UI.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' insert_js()
#' }

insert_js <- function(){

  shiny::insertUI(selector = "head",
                  where = "beforeEnd",
                  ui = htmltools::includeScript(system.file("js/ktag.js", package = "ktag")))

}
