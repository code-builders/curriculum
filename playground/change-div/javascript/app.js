$(function() {
  $(".box").click(function() {
    if ($(this).width() < 500) {
      $(".box").animate({width: 500, height: 500}, 2000)
    } else {
      $(".box").animate({width: 100, height: 100}, 2000)
    }
    $(".box").toggleClass("change-color");
  });
  $(".box").animate({width: 500, height: 500}, 2000)
  $(".box").addClass("change-color");
});
