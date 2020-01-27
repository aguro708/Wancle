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
//= require jquery3
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// スクロールトップボタンを押すとページ上部にスクロールされる
$(document).on('turbolinks:load', function() {
  $('#back a').on('click',function(){
    $('body, html').animate({
      scrollTop:0
    }, 600);
      return false;
  });
});

// ハンバーガーメニューを押すとページ全体にメニューが表示される
$(document).on('turbolinks:load', function() {
  $('.menu-trigger').on('click', function() {
    $(this).toggleClass('active');
    $('#sp-menu').fadeToggle();
    return false;
  });
 });

// レスポンシブ時、検索ボタンを押すと検索ボックスが現れる
$(document).on('turbolinks:load', function() {
  $('.search-hide-button').on('click', function() {
    $('.wancle-right form').css({'display': 'block'});
    $('.search-hide-button').css({'display': 'none'});
    $('.wancle-sp').css({'display': 'none'});
    return false;
  });
 });
