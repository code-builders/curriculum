var fizzbuzz = function (n) {
  var answer;
  if (n % 15 == 0) {
    answer = "fizzbuzz";
  } else if (n % 5 == 0) {
    answer = "buzz";
  } else if (n % 3 == 0) {
    answer = "fizz";
  } else {
    answer = n;
  }
  return answer;
};

// console.log(anwser); breaks because `answer` is a local variable within fizzbuzz()
console.log(fizzbuzz(1));
console.log(fizzbuzz(2));
console.log(fizzbuzz(3));
console.log(fizzbuzz(4));
console.log(fizzbuzz(5));
console.log(fizzbuzz(15));
console.log(fizzbuzz(45));
console.log(fizzbuzz(1242342));
