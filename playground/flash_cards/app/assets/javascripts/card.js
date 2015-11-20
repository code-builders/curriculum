$(document).ready(function() {

  $(".card").click(function() {
    $(this).children(".answer").toggle()
    $(this).children(".question").toggle()
  });

  $(".next-card").click(function() {
    var visibleCard = $(".card:visible");
    if (visibleCard.is(":last-child")) {
      visibleCard.html("<h2>Good Job!</h2>")
      $(this).remove();
    } else {
      visibleCard.hide();
      visibleCard.next().show();
    }
    return false;
  });

});
