# motivations

## Motivations

I used to have Google Analytics implemented on my website (it’s a
R/Shiny app), but the platform feels a bit of an overkill to cover a
limited scope (too many views, too many reports, too many features).  
Another concern is about privacy since I can’t control what is collected
& tracked.

In a recent update, I removed all Google tags from this app and wanted
to quickly replace it by *something* to monitor basic user actions
(navigation, specific buttons or links and a few inputs).  
The easiest path was to replace de `gtag` CSS class set on my components
by a `ktag` one and basically reuse the very few JavaScript code to send
an event from the client to the Shiny server and write it into a CSV
file.

The R/Shiny community has provided options to cover larger scopes
(monitor everything driven approach), so I am wrapping this code into a
prototype package to cover a specific use case that I would describe
with the following parameters:

- track specific user actions
- reuse the track components based on CSS class approach
- implement the app monitoring in a single call (on server side)
- have no data loaded in session (except a single event observer)
- local save to a .csv file (append events to the log)
