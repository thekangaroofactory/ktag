
// -- track click with class 'ktag'
$(document).on('click', '.ktag', function(event) {

  Shiny.setInputValue('ktag_event', {when: Date.now(), what: event.currentTarget.id});

});
