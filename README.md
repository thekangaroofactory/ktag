# ktag

<!-- badges: start / keep here because it's not displayed the same way in GitHub & pkgdown -->

[![r-cmd-check](https://github.com/thekangaroofactory/ktag/actions/workflows/r-cmd-check.yaml/badge.svg)](https://github.com/thekangaroofactory/ktag/actions/workflows/r-cmd-check.yaml)

<!-- badges: end -->

Prototype for targeted monitoring of user actions in R Shiny apps.

## Lifecycle

[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)

> Note that the package is in early development stage (lifecycle = experimental).\
> It has not yet been deployed (but the idea comes from an app that is deployed).

## Installation

The development version can be installed from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("thekangaroofactory/ktag")
```

## Use case

This package is based on a use case where we don't want to track everything (not every user actions, not every components).\
See motivations article for more details.

## What is logged

A basic CSV file, with columns:

-   who: an id for the session (default uses session\$token)
-   when: the timestamp of the action (either on JavaScript side or on R/Shiny server side)
-   where: the namespace where the component belongs to (module id if using Shiny modules)
-   what: the name of the action (defined by its inputId in most cases)
-   how: additional details about the action
