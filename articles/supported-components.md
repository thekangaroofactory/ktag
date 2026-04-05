# supported-components

## Inputs

- actionButton
- actionLink
- downloadButton
- downloadLink

For other inputs (for example selectInput or numericInput), it’s not
possible to set a CSS class directly on them from the app code.

That being said, it may never be necessary to cover them all since this
package does not address the track-everything use case. Instead, you may
want to fire specific direct calls from the server side using the input
values as *how* values (ex: compute plot with filters).

## Navigation

- nav_panel  
  `ktag` class is automatically added on `<a>` elements holding
  `nav-link` class.

## Other components

- accordion  
  `ktag` class is automatically transformed (moved onto accordion
  buttons)  
  *how* will hold whether accordion panel is expanded or collapsed.  
  `bslib::accordion(class = ‘ktag’, …)`

## Your own stuff

- html tags holding `ktag` CSS class, typically:  
  `tags$a(id = “my_link”, class = “ktag”, …)`

## Direct calls

Log specific actions from server side:  
`ktag(who = session$token, what = "namespace-action_name")`
