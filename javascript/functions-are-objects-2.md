# Functions are objects 2

In this lecture we're going to look at functions as objects (again!).

A function can be assigned as a variable (and this is a commons way of defining a function):

```js
var b = function() {
  console.log("blah");
};
```

This definition does not **run** the function, it only defines it, meaning we will **not** see `"blah"` in our logs yet. We can use this variable `b` just like any other variable, passing it around and assigning it to new variables.

```js
var b = function() {
  console.log("blah");
};

var other = b;
```

Here we've assigned `b` to a new variable, `other`, this is totally valid, again we haven't actually run the `console.log` yet. To actually run the function, we have to put `()` on the end of the variable:

```js
b()
```

## Callbacks

As I mentioned earlier function can also be passed as an argument to another function, this is typically called a callback. Here is trivial example:


```js
var b = function() {
  console.log("blah");
};

setTimeout(b, 2000)
```

The `setTimeout` function is a function that takes two arguments, the first is the callback, the second is the time (in milliseconds) it should wait before executing the callback.

So we see `"blah"` after two seconds.

`setTimeout` is a function provided by the browser. Let's create our own function, first without a callback:

```js
var readFile = function() {
  var f = "This is the fake text we're pretending comes from a file"
  return f;
};
```

This simple function pretends to read data from a file (we've actually just hard coded it in, because we can't read from files using the browser (in Node we could)), so we could use this function like so:

```js
var t = readFile()
```

Ok, now let's make it use a callback instead

```js
var readFile = function(cb) {
  var f = "This is the fake text we're pretending comes from a file"
  cb(f)
};
```

Now this function doesn't directly return a value (it will be `undefined`), instead it takes a single argument `cb`, at the end of the function it uses the argument `cb(f)` (note that it puts `()` on the end, and passes in the value we want to return).

Now let's create another function which will act as the callback

```js
var readFile = function(cb) {
  var f = "This is the fake text we're pretending comes from a file"
  return cb(f)
};

var logStuff = function(stuff) {
  console.log("Start Logging...")
  console.log(stuff)
  console.log("End Logging")
}

readFile(logStuff)
```

## Why?

Because some things are slow, if reading the file took a long time, everything in the browser would stop, like everything. Let's see that in action

```js
function sleepFor( sleepDuration ){
    var now = new Date().getTime();
    while(new Date().getTime() < now + sleepDuration){ /* do nothing */ }
}
sleepFor(10000)
```

This is considered a **blocking** function, meaning that it's slow and it blocks the browser from doing anything else. Most things in javascript that are going to be slow have been made into asyncronous functions, meaning they are **non-blocking**, they will run in the background, and when they are done, they will pass their result into a callback to execute it.

We see this in `$.ajax`, `setTimeout`, and tons of other places.


## Functions as methods

Since functions are objects and they can be assigned to a variable or used in an argument, they can also be the value of a `Array` or `Object`, but most commonly an `Object`.

```js
var person = {
  yell: function(str) { return str.toUpperCase() + "!!!" },
}

person.yell("I'm excited")
```

And we an add other keys to this object:

```js
var person = {
  name: "Al",
  yell: function(str) { return str.toUpperCase() + "!!!" },
  whisper: function(str) { return "shhh ..." + str.toLowerCase() + "..."},
  greet: function() { return "Hello, I'm " + this.name}
}
```

We've added a couple other functions and a non-function `name` attribute. In the `greet` function there is something else special going on, the keyword `this` (like `self` in ruby and python) is referring to the `Object` itself, so you can use one key within another.

## Prototypal design

In the above example we are starting to get into a OO (Object Oriented) type style, although javascript is not based on OO, we can implement an OO style objects:

```js
var Person = function(name) {
  // this is the constructor
  this.name = name;
  return this;
}
// This is like a instance method
Person.prototype.greet = function() { return "Hello, I'm " + this.name }

var s = new Person("Sandy")
var b = new Person("Bobby")

s.greet()
b.greet()
```
