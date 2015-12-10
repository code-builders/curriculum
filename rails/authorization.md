## Authorization

Authorization and authentication are often linked together but it's important to recognize the difference between the two.

- Authentication is  the process of determining that someone is who they say they are
- Authorization is the process of determining if a person is allowed to perform some action.

Authentication is when we compare someones password to the password digest in the database, this proves that the person making the request is who they say they are (by email).

Authorization is used when we want to grant or limit access to a portion of our website based on who they are. Examples of this could be:

- **Action**: Create a new product
- **Rules**:
  - Must be logged in
  - Must be an admin
- **Action**: View a specific order (i.e. with `id = 10`)
- **Rules**:
  - Must be logged in
  - The order `user_id` must equal the logged in users `id`
  - *or* Must be an admin

Typically in a web application when an action is taken that isn't authorized the user is redirected with an error message. We will implement this idea in our test store application.

The rules for authorization are determined uniquely based on your needs, in our appliation we are going to determine is a user is an admin and only authorize admins to create products.

There are many ways to mark a user as an admin, here are a few approaches:

- Create a `admin` boolean column in the database.
- Create a `role` string column in the database, any user with the `role` of `"admin"` is an admin.
- Create a `Role` model and database table with a column of `name` and `user_id`, roles can be added to the `User` model using `has_many`, this would allow a user to have many roles simultaneously. 
