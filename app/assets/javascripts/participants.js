// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

let removedParticipant = () => {
  window.location.reload(true)
}

error = (event, data, status, xhr) => {
  $('table').before("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\" id=\"setting_alert\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>An error has occured while trying to submit your information.</div>");
  $("#setting_alert").append("<br><small>A network error occured, please refresh the page and try again.</small>");
}

$(document).on('turbolinks:load', () => {
  if ( $('meta[controller=participants]').length == 0 ) {
    return;
  }

  onError = error
  onSuccess = null
  onSend = null
  
  $("form[class='button_to']").on('ajax:success', () => {
    setTimeout(removedParticipant, 100)
  });

  $(".edit_participant").on('ajax:error', onError);
  $('[name="participant[hours]"]').change(function() {
    $(this).closest('form').submit();
  });
});