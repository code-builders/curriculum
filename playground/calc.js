var Calculator = {
  add: function(x,y) {
    return x + y;
  }
};

var blah = Calculator.add
blah(1,2);
// Calculator.add = function(x,y) {
//   return x + y;
// };

Calculator.subtract = function(x,y) {
  return x - y;
};

Calculator.times = function(x,y) {
  return x * y;
};

Calculator.divide = function(x,y) {
  return x / y;
};
