## Event Handlers

We're going to briefly about `this` in javascript. `this` is analogous to Rubys `self`. But there are several differences.

The general idea of Javascript's `this` keyword, is that in any function `this` refers to object the function was called on. If the function is defined at the global level, `this` will refer to the `window` object, in Node it will refer to the Node environment.

```js
this
// Window

var blah = function() {
  return this
  // Window, because this function is not called on anything
}
```

So what do we mean by called on something. Well as we've talked about, functions can be attached to Objects, when a function is attached to an object, within the function `this` will refer to the object

```js
var greeting = function () {
  return "Hello, I'm " + this.name;
}

var me = {name: "Bookis", sayHello: greeting}

me.sayHello()
// "Hello, I'm Bookis"
```

So in short `this` is simply the thing that comes before the `.`.

### Event Handlers

This idea isn't any different in the case of `.addEventListener`. Inside of the function `this` will be the object `.addEventListener` was called upon, which is usually an HTML element.

```js
var link = document.getElementById("hide-link");
link.addEventListener("click", function (event) {
  event.preventDefault();
  this // this will be the 'link' element
});
```

This allows for easy DOM traversal when handling an event on a specific element:

```js
var link = document.getElementById("hide-link");
link.addEventListener("click", function (event) {
  event.preventDefault();
  this.parentNode.removeChild(this);
});
```
