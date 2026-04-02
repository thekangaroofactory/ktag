

#' Inject JavaScript Code
#'
#' @returns a script HTML tag
#' @export
#'
#' @importFrom htmltools tags
#'
#' @examples
#' use_ktag()

use_ktag <- function(){

  htmltools::tags$script(

    "// -- track click with class ktag
      $(document).on('click', '.ktag', function(event) {

        Shiny.setInputValue('ktag_event', {when: Date.now(), what: event.currentTarget.id});

      });"

  )

}
