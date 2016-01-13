$(function() {
  var speed = 2000;
  $(".box").click(function() {
    if ($(this).width() < 500) {
      $(".box").animate({width: 500, height: 500}, speed)
    } else {
      $(".box").animate({width: 100, height: 100}, speed)
    }
    $(".box").toggleClass("change-color");
  });
  $(".box").animate({width: 500, height: 500}, speed)
  $(".box").addClass("change-color");
});
