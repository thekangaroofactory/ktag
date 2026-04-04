# Start Recording

Gateway function to setup & init event recording in a single call.

## Usage

``` r
record(session = shiny::getDefaultReactiveDomain())
```

## Arguments

- session:

  the session object of the Shiny server function

## Value

an observer reference class object (see shiny::observeEvent())

## Details

`session` is required to seteup the event listener, register the
onSessionEnded callback, get the URLcquery string & use the token value
as a session uuid.

## Examples

``` r
if (FALSE) { # \dontrun{
ktag::record()
} # }
```
