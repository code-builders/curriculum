## Iteration

Javascript does not have functionality like `Enumerable` in ruby, it's even lacking an `each` method. All iteration has to be done with something `while` or more commonly `for`. The `for` statement has three parts:

- The initial condition
- The condition in which the loop should continue to run
- And the method to work towards an ending condition

Each of these are typically on a single line, seperated by a semicolon. Here is a simple example

```js
var i;
for (i = 0; i < 10; i++) {
  // repeatedly run code here, ten times (0-9)
}
```

In this case our initial condition is `i = 0`, then the condition which this loop should continually run is while `i < 10`, finally the mysterious line `i++` is equivalent to ruby `i += 1`, it increments the value by one, this is going to happen after each iteration over the code.

Although this idea does not specifically utelize an array, we can easily adapt it.

```js
var people = ["Sally", "Bob", "Jim", "Jenny", "Becky", "Jessica"]
for (i = 0; i < people.length; i++) {
  console.log(people[i]);
};
```

While less common a `while` loop works just as well, it's also nearly the same syntax as Ruby.


```js
i = 0;
while (i < 100) {
  console.log(i);
  i++;
}
```

.forEach
--------

`.forEach` in Javascript is closer to the ruby `.each` method, although it's relatively new to javascript, older browsers will not support it (i.e. IE 8 :( ), so be careful to not use it if you are supporting those browsers.


```js
[1,2,3,4].forEach(function(element, index, array) {
  console.log(element);
})
```

Similar to the `.forEach`, there is also a `.map` method in Javascript, which is identical to Rubys. But again, this is not available to older browsers.

```js
[1,2,3,4].map(function(element, index, array) {
  return element * 2;
})
```

Resources
---------
- [`.forEach`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach)
- [`.map`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map)
- [`for`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for)
