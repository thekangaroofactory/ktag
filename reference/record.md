# Start Recording

Gateway function to setup & init event recording in a single call.

## Usage

``` r
record(input, session)
```

## Arguments

- input:

  the input object of the Shiny server function

- session:

  the session object of the Shiny server function

## Value

an observer reference class object (see shiny::observeEvent())

## Details

`input` is required to create the listener that will capture events sent
by the JavaScript code. `session` is required to register the
onSessionEnded callback, get the URL query string & use the token value
as a session uuid.

## Examples

``` r
if (FALSE) { # \dontrun{
ktag::record()
} # }
```
