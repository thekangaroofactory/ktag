# Insert JavaScript

Insert the required JavaScript code from Server side#'

## Usage

``` r
insert_js(session = shiny::getDefaultReactiveDomain())
```

## Arguments

- session:

  the session object of the Shiny server function

## Details

This function is a wrapper around shiny::insertUI() to add the
JavaScript from Server side. This way, no use\_\* call is needed in the
UI.

## Examples

``` r
if (FALSE) { # \dontrun{
insert_js()
} # }
```
