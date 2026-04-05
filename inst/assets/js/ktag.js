
/**
 * JavaScript code from R Package 'ktag'
 * Tracks specific HTML components to allow R Shiny monitoring
 */

// -- Add CSS class on nav links (tabs)
$('a.nav-link').addClass('ktag');

// -- Move CSS class from accordion div to accordion-button
$('div.accordion.ktag button.accordion-button').addClass('ktag');
$('div.accordion').removeClass('ktag');

// -- track click on elements with class 'ktag'
$(document).on('click', '.ktag', function(event) {

  const node = event.currentTarget;

  let when = Date.now();
  let what;
  let how;

  // -- check if node as an id
  if(node.id){
    what = node.id;
  } else {

    // -- a
    if(node.nodeName == 'A' && typeof node.dataset.value !== 'undefined'){
      what = node.dataset.value; // nav links have data-value with tab name
    } else {
      what = node.href;
    }

    // -- accordion-button
    if(node.nodeName == 'BUTTON' && node.classList.contains('accordion-button')){
      what = node.querySelector('div.accordion-title').innerText;
      if(node.classList.contains('collapsed')){
        how = "collapse";
      } else {
        how = "expand";
      }
    }

  }

  // last check (otherwise may raise an error on R side)
  if(what === undefined){
    what = "unknown";
  }

  // update Shiny input
  Shiny.setInputValue('ktag_event', {when: when, what: what, how: how});

});
