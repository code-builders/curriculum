# Create a page in Rails

In this lecture we are going to walk through step-by-step the process of adding a new static page to rails. This is not meant to describe how each piece works, instead just document sane steps you can take to create a new page.

## Prereqs

First we have to have a rails app setup and running. Make sure you've followed the setup guide, which generally includes:

1. Create a rails app: `rails new app_name_here -T -d postgresql`
1. Create your database and run migrations: `bundle exec rake db:create db:migrate`
1.

## 1. Create a route

The first step to creating a new page is to define a new route in `config/routes.rb`. This file defines what are valid URL's for our app. Without any content in routes our server will start but regardless of what page we go to we will either see an error or the rails welcome screen.

## 2. Add a controller

## 3. Add a action (method) to the new controller

## 4. Add a view
