$(document).ready(function() {
  $('a[rel*=facebox]').facebox();
  $("#slides").slides({
    play: 5000,
    pause: 2500,
    slideSpeed: 1500,
    slideEasing: "easeOutQuint"
  });
  $('.scrolldiv').tinyscrollbar();
  $('.nice-links a').hover(function() {
    if ($(this).parent().hasClass('current')) return;
    $(this).stop().animate({color: '#444'}, 1000)
  }, function() {
    if ($(this).parent().hasClass('current')) return;
    $(this).stop().animate({color: '#aaa'}, 1000)
  })
})