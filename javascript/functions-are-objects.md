## Functions

In Javascript the main form of encapsulating code is through a function. Functions are analogous to Rubys methods, but in Javascript functions can just be defined, they don't have to be defined on any particular object. This is a good differentiation for the terms in general. A function is encapsulated code, a method is encapsulated code of a specific object.

### Declaration

Functions can be declared in two distinct ways, there declaration and expressions:

```js
// Declaration
function add(x,y) {
  return x + y;
}

// Expression
var add = function(x,y) {
 return x = y;
};
```

In the past we have mainly seen expressions, and that is what we will continue to use. But what is the difference? Declarations are "hoisted" meaning they are evaluated first, so you can do something like this:

```js
add(1,2) // 3
function add(x,y) {
  return x + y;
}
```

Even though we are using `add` before we are defining the function it still works correctly. If this were a function, we'd get an error that `add is not a function`.

So why use the expression syntax over declarations, a couple of reasons, first depending on hoisting is probably just a bad coding practice, it will be confusing for other people and yourself. Another reason is that functions are objects, the declaration syntax does not highlight that idea while the expression syntax does.

### Functions are objects

In Javascript functions are first-class objects, they are `Function` objects. Functions can be assigned to variables and passed as arguments.

To refer to a function without executing the code, leave off the `()`.

```js
var adder = function(x,y) { return x + y; };
adder // Function, this returns the function object

adder(4,5) // 9, this "calls" the object, meaning it executes the code within the body
```

So if we leave off the `()` we can use the function just like any other object, putting it in an `Array`,`Object`, reassigning it to a different variable.

```js
var adder = function(x,y) { return x + y; };

myFuncs = [adder];

myFuncs[0] // Function
myFuncs[0](10,10) // 20

mather = {addFunc: adder};
mather.addFunc // Function
mather.addFunc(5,5) // 10


var dupAdder = adder;
dupAdder // Function
dupAdder(2,2) // 4
```

Javascript functions can be used as arguments to other functions. Let's say we have a scenario where we want a function which takes an array then gives back a new array of only even numbers, we might make something like:

```js
var matchEvens = function(arr) {
  var i;
  var newArr = [];
  for (i = 0; i < arr.length; i++) {
    if (arr[i] % 2 === 0) {
      newArr.push(arr[i]);
    }
  }
  return newArr;
}
```

But our requirements change, we are told we need to also make a function which matches odds. We could define a new `matchOdds` method like so:

```js
var matchEvens = function(arr) {
  var i;
  var newArr = [];
  for (i = 0; i < arr.length; i++) {
    if (arr[i] % 2 !== 0) {
      newArr.push(arr[i]);
    }
  }
  return newArr;
}
```

But what if even another requirment is give,  it should also be able to match all numbers divisible by 3, 5, or 15. We *could* define methods for all of these, but it would get a bit redundant because 90% of the code is the same, it's really just the conditional which changes.

In this case we can take advantage of the fact that functions are objects, we can make a general method which creates a new array on some conditional, but we can pass in a function to act as the logic for the conditional

```js
var isEven = function(n) { return n % 2 === 0 };
var isOdd  = function(n) { return n % 2 !== 0 };
var isFizz  = function(n) { return n % 3 === 0 };
var isBuzz  = function(n) { return n % 5 === 0 };
var isFizzBuzz  = function(n) { return n % 15 === 0 };

var matches = function(arr, matcher) {
  var i;
  var newArr = [];
  for (i = 0; i < arr.length; i++) {
    if (matcher(arr[i])) {
      newArr.push(arr[i]);
    }
  }
  return newArr;
};

// passing in defined functions
matches(arr, isEven);
matches(arr, isOdd);
matches(arr, isBuzz);

// Or passing in inline "anonymous" functions
matches(arr, function(n) { return n % 2 === 0 });
matches(arr, function(n) { return n % 2 !== 0 });

```
