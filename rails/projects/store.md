# Store

## Goals

The goal for this project is to dive into the deep end in Rails, we will be introducing three new big ideas: user authentication, image uploads/storage, complex active record associations. The goal will be to get in a use them all to get a feel for how they work, mastery will come later. We will also be learning and using the idea of user roles to control permissions within the application.

## Overview

You will create a database backed Rails application where owner/administrators can manage all aspects of their online store. The application will have the following major components:

- Products
  - name
  - description
  - image (with CarrierWave uploading)
  - has many ProductOptions
    - name
    - price_in_cents
    - product_id
- Orders
  - user_id
  - status (defaults to `browsing`)
  - total (must be stored so if prices change, the total does not update)
  - has many Items
    - order_id
    - product_option_id
    - price
    - quantity (defaults to `1`)
- Users
  - email
  - password_digest
  - has many Orders

## User Stories

- As a guest I can view the home page at "/"
- In the header on all pages
  - As a guest I can click a link to my cart which contains the number of items in my cart, which takes me to a cart page
  - As a guest I can click a link to view my account page
- On the homepage
  - As a guest I can see a list of all available products with their image, name, and price
  - As a guest I can click on the name or image to view a product page
  - As a guest I can see a link to my
