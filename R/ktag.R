

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

ktag <- function(..., path = Sys.getenv("DATA_HOME")){

  stopifnot("DATA_HOME environment variable is not set or path is NULL" = !is.null(path))

  if(Sys.getenv("KTAG") == "OFF")
    return()

  arg_list <- list(...)
  x <- data.frame(who = arg_list$who,
                  when = if("when" %in% names(arg_list)) arg_list$when else round(as.numeric(Sys.time()) * 1000, digits = 0),
                  where = if("where" %in% names(arg_list)) arg_list$where else paste(utils::head(unlist(strsplit(arg_list$what, split = "-")), -1L), collapse = "-"),
                  what = utils::tail(unlist(strsplit(arg_list$what, split = "-")), 1L),
                  how = if("how" %in% names(arg_list)) arg_list$how else NA)

  col_names <- !file.exists(file.path(path, "ktag.csv"))

  utils::write.table(x,
                     file = file.path(path, "ktag.csv"),
                     append = TRUE,
                     sep = ",",
                     quote = FALSE,
                     col.names = col_names,
                     row.names = FALSE,
                     fileEncoding = "UTF-8")

}
