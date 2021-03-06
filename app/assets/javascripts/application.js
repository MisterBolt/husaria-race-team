// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap
//= require moment
//= require bootstrap-datetimepicker
//= require bootstrap-switch
//= require_tree .


$(function () {
    $('#datetimepicker').datetimepicker({
        viewMode: 'years',
        format: 'DD-MM-YYYY HH:MM'
    });

    $('#datetimepicker2').datetimepicker({
        viewMode: 'years',
        format: 'DD-MM-YYYY HH:MM'
    });
});


$('.navbar .dropdown').hover(function() {
    $(this).find('.dropdown-menu').first().stop(true, true).delay(250).slideDown();
}, function() {
    $(this).find('.dropdown-menu').first().stop(true, true).delay(100).slideUp()
});