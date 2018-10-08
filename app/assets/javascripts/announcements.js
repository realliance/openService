// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

String.prototype.capitalizeFirstLetter = function() {
  return this.charAt(0).toUpperCase() + this.slice(1);
}

announcementsSend = () => {
  formSend('announcement')
}

announcementsError = (announcement, data) => {
  formErrors('announcement', data)
}

announcementsSuccess = function() {
  $(this).children('fieldset').addClass('form-group has-success');
  setTimeout (window.location.href = "/", 500);
}

$(document).on('turbolinks:load', () => {
  if ( $('meta[controller=announcements]').length == 0 ) {
    return;
  }

  onSend = announcementsSend
  onError = announcementsError
  onSuccess = announcementsSuccess;

  $("form[id*='announcement']").on('ajax:send', onSend);
  $("form[id*='announcement']").on('ajax:success', onSuccess);
  $("form[id*='announcement']").on('ajax:error', onError);
});