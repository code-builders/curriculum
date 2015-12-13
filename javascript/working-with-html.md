# Selecting and Manipulating HTML

First, when dealing with selecting HTML element, you first have to be certain the page is completed loading, otherwise the HTML probably will not exist yet to be selected. To do this wrap all javascript in this function:

```js
window.onload = function () {

};
```

Javascript in the browser has many built in function to help find and manipulate HTML elements. First, the most common way to find an HTML element using javascript is by it's `id` attribute.

```js
document.getElementById("an-id");
```

We can change many attributes on an HTML element after we've selected it. Here are a few examples:

```js
var title = document.getElementById("title");

title.style.color = "green";
// .style gives access to the css for this element, .whatever is a way to set that css property.

title.className = "text-success";
// .className changes the class, be careful because it overrides the value rather than adding to it

title.innerHTML = "Some Text";
// .innerHTML replaces the content of the element

var mainContent = document.getElementById("main");

mainContent.children
// .children returns a collection of HTML elements

mainContent.children["an-id"]
// .children[''] selects a specific child with the given id.

mainContent.children[0]
// .children[n] selects a specific child at the index of n
```

### Event Handlers

The HTML/Javascript interactions are triggered by "events". Basically any user action in a web browser triggers an event. We can take advantage of this by specifying code which should run when a specific event happens. The most common event is  `click`, but others are `onkeyup` and `scroll`. Some HTML element types even have their own events such as `submit` for a form.

We attach code to an elements event with `.addEventListener`, the first argument is the event which you want to respond to, the second is a function (called the event handler) which will run when the event happens.

```js
var nukeButton = document.getElementById("nuke");
nukeButton.addEventListener("click", function () {
  document.body.innerHTML = "";
});
```

When an event happens, a special `event` object is created, you have access to this object within the function you define. This `event` object is used to find details about the event as well as change what the `event` does. For example the `submit` event typically sends an HTTP request, but we can override that functionality by calling a function on the `event`

```js
var myForm = document.getElementById("my-form");
myForm.addEventListener("submit", function (event) {
  event.preventDefault();
  alert("I won't submit!");
});
```
