# ktag

## Get Started

### Setup environment

Set the `KTAG_PATH` environment variable to define the path where to
store the log file (ktag.csv).

### Tag components

Add the `ktag` class to specific inputs you want to track (see supported
types).  
Note: this CSS class is not defined anywhere so it won’t apply any
style. It will just serve as a JQuery
[selector](https://api.jquery.com/category/selectors/).

### Init recording

On the server side, call the
[`record()`](https://thekangaroofactory.github.io/ktag/reference/record.md)
function:

``` r
# -- monitor the app in a single call ktag::record()
```

There is no need to insert the JavaScript code on UI side – It’s all
wrapped into the
[`record()`](https://thekangaroofactory.github.io/ktag/reference/record.md)
function: insert the JavaScript, log session start, register session end
callback, create a (single) event listener.

FYI – the event listener is plugged on an input named `ktag_event` that
should not be used anywhere inside the app to ensure uniqueness.

## Disable recording

It is possible to disable writing the output file by setting
`KTAG_STATE=OFF` (most probably in development environment).
