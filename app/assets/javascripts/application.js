// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery-ui
//= require select2
//= require project/alert
//= require alert_message
//= require clipboard
//= require turbolinks

document.addEventListener('turbolinks:load', function() {
  //$('.select2').select2();

  // Clipboard JS
  var clip = new Clipboard('.clipboard');
  console.log(clip);

  // Select 2
  $(".select2").select2();

  $('.datepicker').datepicker();
});
