var subtractor = function (x,y) {
  return x - y;
}

var adder = function (x,y) {
  return x + y;
};

console.log(subtractor(5,2));

var me = {
  name: "Bookis",
  age: 29,
  beSmart: function (x,y) {
    return x * y;
  },
  yell: function() {
    console.log("Ahhhhhh!")
  }
};


[1,2,3,4] // [2,4]

var checker = function(n) {
  return n % 2 == 0;
};

isEven = function(n) { return n % 2 === 0 };
isOdd  = function(n) { return n % 2 !== 0 };
isFizz  = function(n) { return n % 3 === 0 };
isBuzz  = function(n) { return n % 5 === 0 };
isFizzBuzz  = function(n) { return n % 15 === 0 };

var find_all = function(arr, checkNum) {
  var newArr = [];
  for (i = 0; i < arr.length; i++) {
    if (checkNum(arr[i])) {
      newArr.push(arr[i]);
    }
  }
  return newArr;
};

var people = ["Becky", "Bill", "Jenny", "Buck", "B", "Samantha"];

find_all(people, isOdd);




arrayMatcher([1,2,3,4], isEven)
arrayMatcher([1,2,3,4], isOdd)
arrayMatcher([1,2,3,4], isFizz)
// arr = [1,2,3,4] first arg
// checkNum = isFizz(1) second arg which is a function








var odds = function(arr) {
  var newArr = [];
  for (i = 0; i < arr.length; i++) {
    if (arr[i] % 2 !== 0) {
      newArr.push(arr[i]);
    }
  }
  return newArr;
};

var fizz = function(arr) {
  var newArr = [];
  for (i = 0; i < arr.length; i++) {
    if (arr[i] % 3 === 0) {
      newArr.push(arr[i]);
    }
  }
  return newArr;
};

var buzz = function(arr) {
  var newArr = [];
  for (i = 0; i < arr.length; i++) {
    if (arr[i] % 5 === 0) {
      newArr.push(arr[i]);
    }
  }
  return newArr;
};

var fizzbuzz = function(arr) {
  var newArr = [];
  for (i = 0; i < arr.length; i++) {
    if (arr[i] % 15 === 0) {
      newArr.push(arr[i]);
    }
  }
  return newArr;
};



evens([1,2,3,4]) // [2,4]
