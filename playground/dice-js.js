var dice = {values: [], pool: ["One", "Two", "Three", "Four", "Five", "Six"]};
dice.randNum = function(upto) {
  upto = upto || 6
  return Math.floor((Math.random() * upto) + 1);
}
dice.roll = function (n) {
  var i;

  dice.values = [];
  for (i = 0; i < n; i++) {
    i++
    dice.values.push(dice.randNum());
  }
  return dice.values
};


dice.roll(4);
dice.roll(4);
console.log(dice.values);
