// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require popper
//= require bootstrap-sprockets
//= require_tree .

let reload = () => {
  window.location.reload(true)
}

let formSend = (tag) => {
  $('fieldset').attr('class', 'form-group');
  $('fieldset').children('div').remove();
  $("#" + tag + "_alert").remove();
  $('input').attr('disabled', true);
}

let formErrors = (tag, data) => {
  $('input').attr('disabled', false);
  $('h1').before("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\" id=\"" + tag + "_alert\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>An error has occured while trying to submit your information.</div>");
  if (data.responseJSON !== undefined) {
    var errors = data.responseJSON.error;
    for (var form in errors) {
      var fieldSet = $("label[for=" + tag + "_" + form + "]").parent();
      fieldSet.addClass('form-group has-danger');
      for (var key in errors[form]) {
        error = form.capitalizeFirstLetter().replace(/_/g, ' ') + ' ' + errors[form][key];
        fieldSet.append("<div><small class=\"text-danger\">" + error + "</small></div>");
      }
    }  } else {
    if (data.readyState == 0) {
      $("#" + tag + "_alert").append("<br><small>A network error occured, please check your internet connection.</small>");
    }
  }
}

let onSuccess = null;
let onSend = null;
let onError = null;

$(() => {
  $(".logout_form").submit((event) => {
    setTimeout(reload, 100)
  })
})