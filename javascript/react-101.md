# React

In this lecture we're going to install and setup a bare bones react application using browserify to compile our JSX and modular javascript into a single javascript file (more on this later).

## Installation

```sh
npm install --save react react-dom
npm install --save-dev babelify babel-preset-react watchify http-server
```
This will install all of the components we will need, let's walk through what all of them do:

- `react` this is the core react library where most of the functionality comes from, this will be used inside of our app.
- `react-dom` this is an extra component of react, which adds the functionality of the dom manipulation which is not required for all React apps.
- `babelify` and `babel-preset-react` these libraries compile our code from JSX to pure javascript.
- `watchify` this is library which allows our JSX files to be watched, anytime they are changed the files are recompiled into javascript.
- `http-server` a simple webserver which will serve our `index.html` and any other static assets such as images.

## JSX

A quick note on JSX, it's a special dialect of javascript meant to be preprocessed into actual javascript. It helps write HTML like documents with custom XML like objects within a javascript file, to be compiled into valid react code. For example it allow us to write:

```js
<div>
  <MyComponent />
</div>
```

Which would be compiled into valid react code to create an HTML structure which includes the `MyComponent` module we create.

## Getting started

Now that we've breifly explained how to get setup, we need to start `watchify` and our server:

```sh
watchify -t [ babelify --presets [ react ] ] index.jsx -o bundle.js
```

This will start the process to watch the `index.jsx` file and compile it into pure javascript in the `bundle.js` file.

Next, in a new tab, we'll start the server with:

```sh
http-server .
```

## Writing a module

In this app we are going to create a simple email dashboard to read, create, and delete email. First we'll start with just getting Hello World to show up then move on to the actual app.

Create a `index.jsx`

```sh
touch index.jsx
```

Open the file in your prefered text editor and add the following:

```js
'use strict';

var React = require('react');
var ReactDOM = require('react-dom');

var Email = React.createClass({
  render: function(){
    return <div>Im an email component!</div>
  }
});

ReactDOM.render(<Email />, document.getElementById('email'));
```

Let's break this down a bit, `use strict` is a feature to make browsers be more strict about your javascript code, in some cases giving errors instead of warnings, this can help write better code.

```js
var React = require('react');
var ReactDOM = require('react-dom');
```

These two lines require the react libraries we'll be using in the future we can make our app more modular and use these require statements to break our code into different files. This is not standard javascript in the browser, but since our code in running through a preprocessor, the files can be read and concatenated into a single file.

```js
var Email = React.createClass({
  render: function(){
    return <div>Im an email component!</div>
  }
});
```
These lines are to create a custom component, there are many things you can create with component but this one just involves the bare-bones. To create a component we use this `React.createClass` and assign it to a variable `Email`. The function `createClass` takes an `Object` argument, it must have a key called `render`, whatever this function returns is the HTML which will be rendered for this component. Components are often nested within each other, so here we have a `div` but we could have another component nested within here.

This is where most of our custom logic will go, creating custom components and nesting them together.

And finally

```js
ReactDOM.render(<Email />, document.getElementById('email'));
```
This line is the one that actually puts our HTML on the page. This takes the `Email` object we defined, runs the `render` function on it, and inserts the result in the `<div id='email'></div>`. When `Email` has many nested components the nested HTML will be quite complex.

Finally we need to create the `index.html` which all of this javascript and HTML will load from/to.

```sh
touch index.html
```

In this file we'll want to make our email div and include the `bundle.js` javascript file.


```html
<!DOCTYPE html>
<html>
<head>
    <title>Email App</title>
</head>
<body>
    <div id="email">
    </div>
    <script type="text/javascript" src="/bundle.js"></script>
</body>
</html>
```

Now open the browser to [http://localhost:8080](http://localhost:8080)
