## Shopping List

Create a javascript application where one can create and manage shopping list items.

- As a user I see an HTML form to create a new list item with a name
  - When I click a "Add Item" button
    - The form values are reset
    - A shopping list item is added to a `ul` as an `li`
- As a user I can see a list of created shopping list items
- As a user I can press a "Complete" button or checkbox, when clicked
  - The item is marked as complete
  - The item moves to the bottom of the list
  - The item becomes gray or semi-transparent to indicate it's complete
- As a user I can see a "x" button, which clicked
  - The "x" button disappears
  - A separate "DELETE" button appears when clicked the item is completely removed from the list (think of the second button as a confirmation)


### Extended Requirments

- Add a due date to the list items, the list should be ordered by the due date
- Add a "Edit" button when clicked shows form inputs for name, due date, complete, and a submit button. When clicked the values are updated.
