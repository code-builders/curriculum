$(function() {
  $(".box").click(function() {
    $(".box").animate({width: 100, height: 100}, 2000)
    $(".box").removeClass("change-color");
  });
  $(".box").animate({width: 500, height: 500}, 2000)
  $(".box").addClass("change-color");
});
