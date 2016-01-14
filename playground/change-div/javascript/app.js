$(function() {
  $(".box-width").change(function() {
    var width = $(this).val();
    $(this).siblings(".box").animate({width: width}, 300)
  });
});
