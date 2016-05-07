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
//= require jquery2
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require angular
//= require_tree .

/// <reference path="typings/jquery.d.ts" />

// Changes the position of the fixed header when scrolling horizontally.
$(window).scroll(function() {
    $('.header-x-scroll').css('left', -$(this).scrollLeft() + "px");
    $('.content-left').css('left', -$(this).scrollLeft() + "px");
});

var readyFunc = function() {
    var offset = 220;
    var duration = 500;
    $(window).scroll(function() {
        if ($(this).scrollTop() > offset) {
            $('.crunchify-top').fadeIn(duration);
        } else {
            $('.crunchify-top').fadeOut(duration);
        }
    });

    $('.crunchify-top').click(function(event) {
        event.preventDefault();
        $('html, body').animate({scrollTop: 0}, duration);
        return false;
    });
};

$(document).ready(readyFunc);
$(document).on('page:load', readyFunc);