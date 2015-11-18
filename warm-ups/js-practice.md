## Js Practice

Clone this [js practice repo](https://github.com/code-builders/js-practice) and start the http-server:

```sh
git clone https://github.com/code-builders/js-practice
cd js-practice
http-server
```

Open a browser to http://localhost:8080.

This project has an html, css, and js file. The html file is already setup up to load the js, jquery, and css files. Add the following functionality using javascript.

1. When the "See Topics" link it clicked
  - show the list of topics (hidden by default)
  - Change the text of the link to "Hide Topics"
  - When the link is clicked again, undo the above two
1. When a the form is submitted, instead of allowing the form to submit to the server, override the functionality to just add an `<li>` the topics list without the page refreshing (this is only a static HTML file, it's not connected to a real web application.). For this you will need to research the jquery `.submit()`, and `.preventDefault()` methods.
