# Store

## Goals

The goal for this project is to dive into the deep end in Rails, we will be introducing three new big ideas: sessions, user authentication, and complex active record associations. The goal will be to get in a use them all to get a feel for how they work, mastery will come later. We will also be learning and using the idea of user roles to control permissions within the application.

## Overview

You will create a database backed Rails application where owner/administrators can manage all aspects of their online store. The application will have the following major components:

#### Guidelines

- Use [Trello.com](http://trello.com) as a project management service to map out tasks which need to be completed
- Build a logical user-flow that moves across multiple controllers and models
- Use HTML/CSS to style your website.

### Restrictions

- Do not use gems for user authentication (such as Devise)
- Do not use Rails `scaffold` generator (All other Rails generators are fine)

### Tables

- Products
  - name*
  - description
  - image_url* (images must be stored somewhere online, sign up for Amazon S3 for an easy place to permanently store images.)
  - has many ProductOptions
    - name*
    - price_in_cents*
    - product_id*
- Orders
  - user_id
  - name*
  - shipping_address*
  - status* (defaults to `browsing`)
  - total* (must be stored so if prices change, the total does not update)
  - has many Items
    - order_id*
    - product_option_id*
    - price*
    - quantity* (defaults to `1`)
- Users
  - email*
  - password_digest*
  - has many Orders

## User Stories

- In the header on all pages
  - I can click the logo/title to return to the homepage
  - I can click a link to my cart which contains the number of items in my cart, which takes me to a cart page
  - As a guest I can click a link to view a sign up page
  - As a guest I can click a link to view a sign in page
  - As a logged in user I cannot see a link to view a sign up or sign in page
  - As a logged in user I can click a link to view my account page
  - As a guest I cannot see a link to view my account page
  - As an admin I can see a "Products" link which takes me to the admin product management page
  - As an admin I can see a "Order" link which takes me to the admin order management page
- On the admin product management page `/admin/products`
  - I can see a "Add a product" link which takes me to a page to add a product
  - I can see a list of existing products including their name and image
  - I can see an "Edit" link, which takes me to a page to edit the item
  - I can see a "Delete" link, which deletes the item from the database, then returns me to the admin products page
- On the product new page `/admin/products/new`
  - I can see a text field for the name and description, and image url.
  - I can press the submit to create the product, then I am sent to the admin product edit page
- On the admin product edit page `/admin/products/:id`
  - I can see a text field for the name and description, and image url
  - I can press an "Update" button to update the product attributes, then I am sent to the admin product edit page
  - I can add a product option in a form including it's name and price, after creating it am returned to the admin product edit page
- On the admin orders management page `/admin/orders`
  - I can see a list of orders including their name, address, status, total, and a list of items including their name and price
  - I can click a "Shipped" link to update the `status` column to "shipped" for that order
- On the homepage `/`
  - I can see a list of all available products with their image, name, and price
  - I can click on the name or image to view a product page
- On a product page `/products/:id`
  - I can see the product name, description, and image.
  - I can see a list of product options related to the products either as:
    - a select dropdown with a "Add to cart" button, or
    - an "Add <name> to cart" for each option
  - When I click an "Add to cart" button
    - The product option I selected is added to my cart
    - I am taken directly to the cart page
- On the cart page `/cart`
  - If my cart has 0 items in it, I should see the text "Your cart is empty"
  - I can see a list of items I've added to my cart, including the name, product name, product image, price, and quantity
  - I can click a "Remove" button on any item to remove it from my cart
    - After the item is removed, I should be returned to the cart page
  - I can update the quantity of any item in my cart by changing a text field and pressing a "Update cart" button
    - After the quantity is updated, I should be returned to the cart page
  - I can click a "Checkout" button to proceed with checkout
- On the checkout page `/checkout`
  - I see a brief summary of my order (total price)
  - I must put in my name and address.
  - I can click a "Submit order" button
    - If the order is valid I am taken to an order confirmation page
    - If the order is invalid, the checkout page is rendered displaying any appropriate error messages
- On the Order summary page `/orders/:id`
  - I can see the text "Order confirmation"
  - I can see a list of items for this order, including the name, product name, product image, price, and quantity.
- On the sign up page `/sign-up`
  - I can enter my email, password, and password confirmation
  - I can click a "Sign up" button
    - If I've given a valid user a user is created and I am signed in then returned to the homepage
    - If I've given an invalid user, the sign up page is rendered with the appropriate error messages
- On the sign in page `/sign-in`
  - I can enter my email and password
  - I can click a "Sign in" button
    - If I've given a valid sign in I am signed in then returned to the homepage
    - If I've given an invalid sign in, the sign in page is rendered with the error message "Wrong username or password"
