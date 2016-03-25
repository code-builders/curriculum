# React 105

We'll start by creating a Rails app where we can store the email data in a database, from the root of your React project:

```sh
rails new . -T -d postgresql
# the `.` tells rails to install into the current directory instead of making a new one

rake db:create
rails server
```

Next we're going to move our `index.html` into the public directory, this will allow it to be served statically, which means it won't go through any controller. We can do the same with the stylesheet and javascript.

```sh
mv index.html public/
mv stylesheets/ public/
mv bundle.js public/
```

Next, we're going to start our `watchify` task modified to fit the rails structure.

```
watchify -t [ babelify --presets [ react ] ] index.jsx -o public/bundle.js
```


Now our app should display normally at localhost:3000.

Now we are going to create a model and controller to serve JSON for our emails

```
rails g model email to from subject:text body:text
rake db:migrate

rails g controller emails
```
First add routes for our emails controller

```rb
resources :emails
```

Open up the controller and make it return simple JSON for the all of the email objects:


```
def index
  render json: Email.all
end
```

Next, let's go into the rails console and make some test data:


```rb
Email.create(subject: "Hello there!", body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", from: "Tammy", to: "Bookis")

Email.create(subject: "Oh hi!", body: "Lorem ipsum", from: "Chris", to: "Bookis")
```

Now we have our JSON api to work with, and some real data. Next we'll add to react to get this data from the server.

Let's quickly add jquery to our index.html to make ajax requests with:

```html
<head>
  <meta charset="utf-8">
  <title>React Email</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
  <link rel="stylesheet" href="/stylesheets/email.css" media="screen" charset="utf-8">
</head>
```

We want to add a function called `componentDidMount` to our `Email` component, this is where we will do an ajax request.


```js
componentDidMount: function() {
  var that = this;
  $.ajax("/emails").then(function(emails) { that.setState({emails: emails})})
},
```
