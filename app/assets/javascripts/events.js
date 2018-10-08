// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

String.prototype.capitalizeFirstLetter = function() {
  return this.charAt(0).toUpperCase() + this.slice(1);
}

let joinComplete = () => {
  window.location.reload(true)
}

eventsSend = () => {
  formSend('event')
}

eventsError = (event, data) => {
  formErrors('event', data)
}

eventsSuccess = () => {
  $(this).children('fieldset').addClass('form-group has-success');
  if ($(this).hasClass('new_event')) {
    setTimeout (window.location.href = xhr.getResponseHeader('Location'), 500);
  } else {
    setTimeout (window.location.href = "./", 500);
  }
}

$(document).on('turbolinks:load', () => {
  if ( $('meta[controller=events]').length == 0 ) {
    return;
  }

  $('#event_start_time').datetimepicker();
  $('#event_end_time').datetimepicker();

  onSend = eventsSend
  onError = eventsError
  onSuccess = eventsSuccess
  
  $("form[class='button_to']").on('ajax:success', () => {
    setTimeout(joinComplete, 100)
  });

  $("form[id*='event']").on('ajax:send', onSend);
  $("form[id*='event']").on('ajax:success', onSuccess);
  $("form[id*='event']").on('ajax:error', onError);
});