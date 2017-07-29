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
//= require jquery-mask-plugin/dist/jquery.mask
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery-ui
//= require select2/dist/js/select2
//= require project/alert
//= require alert_message
//= require clipboard
//= require turbolinks

document.addEventListener('turbolinks:load', function() {
  //$('.select2').select2();

  // Clipboard JS
  var clipboard = new Clipboard('.clipboard');

  clipboard.on('success', function(e) {
    alert('Senha copiada para sua área de tranferência');
    e.clearSelection();
  });

  clipboard.on('error', function(e) {
      console.error('Action:', e.action);
      console.error('Trigger:', e.trigger);
  });

  // Select 2
  $(".select2").select2();

  // Calendar
  $(".calendar").datepicker();

  // Translate datepicket
  $.datepicker.regional['pt-BR'] = {
    closeText: 'Fechar',
    prevText: '&#x3c;Anterior',
    nextText: 'Pr&oacute;ximo&#x3e;',
    currentText: 'Hoje',
    monthNames: ['Janeiro','Fevereiro','Mar&ccedil;o','Abril','Maio','Junho',
    'Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun',
    'Jul','Ago','Set','Out','Nov','Dez'],
    dayNames: ['Domingo','Segunda-feira','Ter&ccedil;a-feira','Quarta-feira','Quinta-feira','Sexta-feira','Sabado'],
    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sab'],
    dayNamesMin: ['Dom','Seg','Ter','Qua','Qui','Sex','Sab'],
    weekHeader: 'Sm',
    dateFormat: 'dd/mm/yy',
    firstDay: 0,
    isRTL: false,
    showMonthAfterYear: false,
    yearSuffix: ''};

  $.datepicker.setDefaults($.datepicker.regional['pt-BR']);

  // Macks
  $('.date').mask('00/00/0000');
  $('.cpf').mask('000.000.000-00');
  $('.time').mask('00:00');

  // Mobile menu
  $('.menu-mobile').on('click touchstart', function(e){
    $('.menu-aside').toggleClass('menu-mobile-active');
    e.preventDefault();
  })
});
