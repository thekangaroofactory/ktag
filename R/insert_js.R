

#' Insert JavaScript
#'
#' @description
#' Insert the required JavaScript code from Server side#'
#'
#' @param session the session object of the Shiny server function
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

insert_js <- function(session = shiny::getDefaultReactiveDomain()){

  # -- heck file js
  target_url <- system.file("assets/js/ktag.js", package = "ktag")
  if(identical(target_url, ""))
    stop("The JavaScript asset is not found. Check ktag package installation.")

  shiny::insertUI(selector = "head",
                  where = "beforeEnd",
                  ui = htmltools::includeScript(target_url),
                  session = session)

}
