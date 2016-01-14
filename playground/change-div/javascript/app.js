$(function() {
  $(".box-width").change(function() {
    var width = $(".box-width").val();
    $(".box").animate({width: width}, 200)
  });
});
