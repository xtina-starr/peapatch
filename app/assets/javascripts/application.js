// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function (){
  $('#menu-expander').click(function(){
    $('.dropdown').toggleClass('visible');
  });

  $('#new_comment').submit(function (){
    $.post($(this).attr('action'), $(this).serialize(), null, "script");
      return false;
  });
  $('.delete').click(function(){
    comment = $(this).attr('href'),
    $.ajax({
      url: $(this).parent('div'),
      type: 'DELETE',
      dataType: 'json',
      success: function(data, textStatus, xhr) { // What to do after the request succesfully completes
        comment.remove(); // .remove() removes an element from the DOM
      }
    });
  });
});