# Log User Actions

Log User Actions

## Usage

``` r
ktag(..., path = Sys.getenv("KTAG_PATH"))
```

## Arguments

- ...:

  parameters to log (see details)

- path:

  where to store the log file

## Details

The function understands the following parameters in ...

- who: who is performing the action, session\$token could be a pick

- when: usually a timestamp, Sys.time() if omitted

- where: from where the action is performed. When omitted, it will
  extract the namespace from what

- what: the name of the action. Usually the id of the input, including
  its namespace

- how: additional info to log, like the value of an input for example

## Examples

``` r
if (FALSE) { # \dontrun{
ktag(who = session$token, what = "namespace-action")
} # }
```
