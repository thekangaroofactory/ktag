

#' Log User Actions
#'
#' @param ... parameters to log (see details)
#' @param path where to store the log file
#'
#' @details
#' The function understands the following parameters in ...
#' - who: who is performing the action, session$token could be a pick
#' - when: usually a timestamp, Sys.time() if omitted
#' - where: from where the action is performed. When omitted, it will extract the namespace from what
#' - what: the name of the action. Usually the id of the input, including its namespace
#' - how: additional info to log, like the value of an input for example
#'
#' When an html component has no id, the function will raise a warning in the console
#' and ignore the call.
#'
#' At least what should be provided. If the ktag CSS class was applied on an object, it will
#' be the name-spaced inputId.
#' Where is meant to be extracted from what. This is particularly useful when working with
#' Shiny modules.
#'
#' @export
#'
#' @importFrom utils head
#' @importFrom utils tail
#' @importFrom utils write.table
#'
#' @examples
#' \dontrun{
#' ktag(who = session$token, what = "namespace-action")
#' }

ktag <- function(..., path = Sys.getenv("KTAG_PATH")){

  # -- check env
  stopifnot("KTAG_PATH environment variable is not set or path argument is empty." = !identical(path, ""))
  if(Sys.getenv("KTAG_STATE") == "OFF")
    return()

  # -- args
  arg_list <- list(...)

  if(!length(arg_list)){
    warning("At least what should be passed to ... argument - call is ignored.")
    return()}

  if(identical(arg_list$what, "") || is.null(arg_list$what)){
    warning("What is either NULL or empty. Check for missing id on a component with class ktag - event is ignored.")
    return()}

  # -- prepare values
  if(!"who" %in% names(arg_list))
    arg_list$who <- ifelse(shiny::isRunning(), shiny::getDefaultReactiveDomain()$token, "unknown")
  if(!"when" %in% names(arg_list))
    arg_list$when <- round(as.numeric(Sys.time()) * 1000, digits = 0)
  if(!"where" %in% names(arg_list))
    arg_list$where <- paste(utils::head(unlist(strsplit(arg_list$what, split = "-")), -1L), collapse = "-")
  arg_list$where <- utils::tail(unlist(strsplit(arg_list$what, split = "-")), 1L)
  if(!"how" %in% names(arg_list))
    arg_list$how <- NA

  # -- write
  x <- as.data.frame(arg_list)
  f_exists <- !file.exists(file.path(path, "ktag.csv"))
  utils::write.table(x,
                     file = file.path(path, "ktag.csv"),
                     append = !f_exists,
                     sep = ",",
                     quote = FALSE,
                     col.names = f_exists,
                     row.names = FALSE,
                     fileEncoding = "UTF-8")

}
