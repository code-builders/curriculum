$(function() {
  var speed = 500;
  var animateBox = function() {
    var size = ($(this).width() < 500) ? 500 : 100
    $(".box").animate({width: size, height: size}, speed)
    $(".box").toggleClass("change-color");
  }

  $(".box").click(function() {
    animateBox()
  });
  animateBox()
});
