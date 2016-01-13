$(function() {
  var speed = 500;
  $(".box").click(function() {
    var size = ($(this).width() < 500) ? 500 : 100
    $(".box").animate({width: size, height: size}, speed)
    $(".box").toggleClass("change-color");
  });
  $(".box").animate({width: 500, height: 500}, speed)
  $(".box").addClass("change-color");
});
