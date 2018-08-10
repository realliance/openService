// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

String.prototype.capitalizeFirstLetter = function() {
  return this.charAt(0).toUpperCase() + this.slice(1);
}

announcementsSend = () => {
  $('fieldset').attr('class', 'form-group');
  $('fieldset').children('div').remove();
  $("#announcement_alert").remove();
  $('input').attr('disabled', true);
}

announcementsError = (announcement, data, status, xhr) => {
  $('input').attr('disabled', false);
  $('h1').before("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\" id=\"announcement_alert\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>An error has occured while trying to submit your information.</div>");
  if (data.responseJSON !== undefined) {
    var errors = data.responseJSON.error;
    for (var form in errors) {
      var fieldSet = $("label[for=announcement_" + form + "]").parent();
      fieldSet.addClass('form-group has-danger');
      for (var key in errors[form]) {
        error = form.capitalizeFirstLetter().replace(/_/g, ' ') + ' ' + errors[form][key];
        fieldSet.append("<div><small class=\"text-danger\">" + error + "</small></div>");
      }
    }
  } else {
    if (data.readyState == 0) {
      $("#announcement_alert").append("<br><small>A network error occured, please check your internet connection.</small>");
    }
  }
}

announcementsSuccess = (announcement, data, status, xhr) => {
  $(this).children('fieldset').addClass('form-group has-success');
  if ($(this).hasClass('new_announcement')) {
    setTimeout (window.location.href = "/", 500);
  } else {
    setTimeout (window.location.href = "./", 500);
  }
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