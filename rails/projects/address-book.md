# Address Book

## Rails
  - Create a Rails app with a database to keep track of peoples contact information in the database
  - Create routes which return JSON for:
    - `/contacts` - returns JSON for all contacts
    - `/contacts/:id` returns JSON for a single contact with the matching `id`

## Javascript / HTML
  - Create a front-end where a user can view a list of contacts by name, sorted alphabetically.
  - When a user clicks on a name, an ajax request is made to get the full details of that contact, details are then shown on the page:
    - Name
    - Phone
    - Email
    - Address
    - How you know them
  - When a different name is clicked, do a new ajax request, replace the content of the full details with the details of the new person
