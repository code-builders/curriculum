# jQuery 102

jQuery again. We are going to basically be recapping jQuery and comparing it with some plain javascript.

## Selectors

In Javascript we mainly used `.getElementById(idName)` to select elements, one of the main uses for jQuery is to make this idea more robust. Let's look at how to acheive the same functionality as `.getElementById(idname)`.

```js
// Pure js
var image = document.getElementById('post-image');

// jQuery
var image = $("#post-image");
```

These two lines of code select the same element. Here are the pros of using jQuery of pure js:

1. Shorter code
1. Uses CSS selectors
1. Able to use other jQuery methods on the result

Related to #2 above, the biggest win from using jQuery is that we can use any CSS selector, while `getElementById` we can only select by `id`

```js
var image = $(".square-image");
```

In pure js we can actually do the above with `.getElementsByClassName`, something like the following we could not:

```js
var image = $(".description ~ img");
```

This is using a complex jQuery selector to do the equivelent in pure js we would need to do the following:

```js
var image = document.getElemtentsByClassName("description")[0].parentNode.getElementsByTagName("img")
```

### Other functions

- `.css` - changes the css of selected elements
- `.show/.hide/.toggle` - shows and hides the selected elements
- `.html` - returns the `innerHTML` of an element. If given an argument it updates the html
- `.text` - returns the text of an element. If given an argument it updates the text
- `.append/.prepend` - Adds HTML to the selected element
- `.addClass/.removeClass/.toggleClass` - Adds and removes classes from selected elements

### Navigating functions

Any of the navigating functions take an optional argument to additionally scope the navigation with a css selector

- `.children()`
- `.siblings()`
- `.parents()`
- `.parent()`
- `.next()`
- `.find()`
