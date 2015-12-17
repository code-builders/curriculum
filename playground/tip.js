var tip = function (service_rating, total) {
  var t, percentage;

  if (service_rating === "Great") {
    percentage = 0.25;
  } else if (service_rating === "Good") {
    percentage = 0.2;
  } else if (service_rating === "Average") {
    percentage = 0.15;
  } else if (service_rating === "Bad") {
    percentage = 0.1;
  } else if (service_rating === "Terrible") {
    percentage = 0.05;
  } else {
    t = 0;
  }
  t = parseFloat(total) * percentage;
  return t;
}

cconsole.log(answer)
