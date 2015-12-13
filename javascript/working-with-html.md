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
