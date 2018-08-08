// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

String.prototype.capitalizeFirstLetter = function() {
  return this.charAt(0).toUpperCase() + this.slice(1);
}

settingsError = (event, data, status, xhr) => {
  $('table').before("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\" id=\"setting_alert\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>An error has occured while trying to submit your information.</div>");
  $("#setting_alert").append("<br><small>A network error occured, please refresh the page and try again.</small>");
}

settingsSuccess = (event, data, status, xhr) => {
  setTimeout (reload, 100);
}

$(document).on('turbolinks:load', () => {
  if ( $('meta[controller=settings]').length == 0 ) {
    return;
  }

  onError = settingsError
  onSuccess = settingsSuccess
  
  $(".edit_user").on('ajax:success', onSuccess);
  $(".edit_user").on('ajax:error', onError);
  $('[name="user[rank]"]').change(function() {
    $(this).closest('form').submit();
  });
});