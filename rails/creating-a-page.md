# Create a page in Rails

In this lecture we are going to walk through step-by-step the process of adding a new static page to rails. This is not meant to describe how each piece works, instead just document sane steps you can take to create a new page.

## Prereqs

First we have to have a rails app setup and running. Make sure you've followed the setup guide, which generally includes:

1. Create a rails app: `rails new app_name_here -T -d postgresql`
1. Move into the newly created rails app directory `cd app_name_here`
1. Create your database and run migrations: `bundle exec rake db:create db:migrate`
1. Star the rails server: `bundle exec rails server`, this is like the `http-server` it will take over the Terminal tab, it can be stopped by pressing `control-c`
1. In a web browser open http://localhost:3000, between each step refresh this page to check how it's changing.

Also it's important to understand that rails does a lot of magic, many things happen simply by following naming conventions, as we walk through much of this be sure to use the same naming conventions as I do.

## 1. Create a route

The first step to creating a new page is to define a new route in `config/routes.rb`. This file defines what are valid URL's for our app. Without any content in routes our server will start but regardless of what page we go to we will either see an error or the rails welcome screen.

Add a line for the `config/routes.rb` file like below (note there is a lot of stuff in this file, most are notes to help you), the line we add just needs to go between the `Rails.application.routes.draw do` and `end` currently in there.

```rb
# config/routes.rb

Rails.application.routes.draw do

  get "/", to: "home#index"

  # Note 1. `get` is the HTTP verb expected for this route
  # Note 2. `"/"` is the path on our server expected for this route ("/" would be the homepage)
  # Note 3. `to:` is a key to signify which method to run to build the HTML
  # Note 4. `"home#index"` is the definition of the method to use, this will run the `index` method of the `HomeController` class

```

## 2. Add a controller*

\**Note that one controller can serve multiple HTML files, so this step may be optional if you already have a controller defined.*

A controller is a class in charge of assigning variables for data and building the HTML, we will create this file ourselves but rails does have an automated way to create the file. All controllers must be within the `app/controllers` directory, a controller can be named anything, but we have to make sure it corresponds with a defined route (`Note 4` in the routes section explains where these two things must correspond).

```sh
touch app/controllers/home_controller.rb
```

Within the controller we will define the class, so that it has all of the functionality of a controller within rails we need to to inherit from the `ApplicationController` class:

```rb
# app/controllers/home_controller.rb

class HomeController < ApplicationController

end
```

## 3. Add a action (method) to the new controller

Next we will define a method within the controller, this method will be used to generate the HTML for one specific page

```rb
# app/controllers/home_controller.rb

class HomeController < ApplicationController

  def index

  end

end
```

Rails is so magic we don't actually have to do anything to parse the HTML, by following the Rails conventions rails will try to parse HTML that is conventionally associated with a method. Method names within a controller can be named anything, but again we have to make sure it corresponds with the route we defined in step one (Again this is explained in `Note 4`)


## 4. Add a view

Now we need to actually add the HTML file that we want it to read and parse. Again by following the rails conventions we just have to create the file and write HTML, Rails will assume that you've placed it in the correct place.

A view should be placed in a directory and file that corresponds with the controller and method for the route, in this case it's the `HomeController` and `index` method, which would require an HTML file to be defined within `app/views/home/index.html.erb`

```sh
mkdir app/views/home
touch app/views/home/index.html.erb
```

```html
<!-- app/views/home/index.html.erb -->

<h1>Hello Rails</h1>
```

1. the file name is `index.html.erb`, that `.erb` part is important, it allows ruby to be interpreted into the html file.
1. We only need to include the html that would typically be within the `<body>` tag, all of the meta information, links, `DOCTYPE`, and other required HTML tags are automatically included.

## 5. Change the HTML

Add real content in the HTML including `<%= %>` to interpolate ruby.


```html
<!-- app/views/home/index.html.erb -->

<h1>Hello Rails</h1>
<p>The time is <%= Time.now.strftime("%I:%M:%S %p") %></p>
```
