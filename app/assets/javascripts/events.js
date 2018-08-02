// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

String.prototype.capitalizeFirstLetter = function() {
  return this.charAt(0).toUpperCase() + this.slice(1);
}

let reload = () => {
  window.location.reload(true)
}

$(document).on('turbolinks:load', () => {
  if ( $('meta[controller=events]').length == 0 ) {
    return;
  }
  $("form[class='button_to']").on('ajax:success', (event, data, status, xhr) => {
    setTimeout(reload, 100)
  });


  $("form[id*='event']").on('ajax:send', () => {
    $('fieldset').attr('class', 'form-group');
    $('fieldset').children('div').remove();
    $("#event_alert").remove();
    $('input').attr('disabled', true);
  });
  $("form[id*='event']").on('ajax:success', (event, data, status, xhr) => {
    $(this).children('fieldset').addClass('form-group has-success');
    if ($(this).hasClass('new_event')) {
      setTimeout (window.location.href = xhr.getResponseHeader('Location'), 500);
    } else {
      setTimeout (window.location.href = "./", 500);
    }
  });
  $("form[id*='event']").on('ajax:error', (event, data, status, xhr) => {
    $('input').attr('disabled', false);
    $('h1').before("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\" id=\"event_alert\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>An error has occured while trying to submit your information.</div>");
    console.log(data.responseJSON)
    if (data.responseJSON !== undefined) {
      var errors = data.responseJSON.error;
      for (var form in errors) {
        var fieldSet = $("label[for=event_" + form + "]").parent();
        fieldSet.addClass('form-group has-danger');
        for (var key in errors[form]) {
          error = form.capitalizeFirstLetter().replace(/_/g, ' ') + ' ' + errors[form][key];
          fieldSet.append("<div><small class=\"text-danger\">" + error + "</small></div>");
        }
      }
    } else {
      if (data.readyState == 0) {
        $("#event_alert").append("<br><small>A network error occured, please check your internet connection.</small>");
      }
    }
  });
});