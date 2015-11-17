## Getting started with js in Rails

Javascript is a big part of Rails and it's very easy to integrate within an application. Within the `app/assets/javascripts/application.js` file, there are a bunch of comments, these are magic comments which are used to automatically load jquery and any javascript file you create. To add a new javascript file to your application simply add a file with the extension `.js` to `app/assets/javascripts/`, then it will be auto loaded, no need to put a link to it in the `<head>` of your html.

There are a couple other gotchas, one has to do with the order that the javascript file loads, essentially your javascript files will load **before** everything else, this can cause problems if the javascript is manipulating the DOM but the DOM hasn't been loaded by the browser yet, then it will fail to do anything. We get around this by wrapping our javascript in an event which says that the DOM is finished loading. Essentially, in all of your custom `.js` files wrap your code in the following:

```js
$(document).ready(function() {

  // all your js code goes here

});
```

Another gotcha can be the `turbolinks` library, this is part of rails that I often remove as it add more javascript than I care to use and can interfere with your javascript unintentionally, here is how to remove it.

1. Remove `gem "turbolinks"` from the `Gemfile`
1. Remove `, 'data-turbolinks-track' => true` from lines 5 **and** 6 of `application.html.erb`
1. Remove `//= require turbolinks` from `application.js`
