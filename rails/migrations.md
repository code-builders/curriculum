# Active Record Migrations

Rails gives us a structured approach to maintaining the database schema: database migrations. These are step-by-step instructions on how to construct the schema. If done right, they provide a blueprint of not only how to construct the database schema, but a history of how the database requirements have changed over time. A schema starts off with nothing in it, and each migration modifies it. Migrations may add or remove tables, columns, or entries.

```bash
rake db:migrate
```

To create a migration without a model (most commonly in the case of modifying or deleting a table)

```bash
rails generate migration add_author_name_to_posts
```

This will generate a file within the migrate directory, it will be named something like:

```
20151007001749_add_author_name_to_posts.rb
```
Open that file:

```ruby
class AddAuthorNameToPosts < ActiveRecord::Migration
  def change
  end
end
```

Commands to make changes to the database structure go within the `change` method. Some potential methods to make modifications are:

- `create_table(table_name)` - Creates a new table in the database, this is the command that the `Post` migration used.
- `add_column(table_name, column_name, data_type, options)` adds a column to the given table.
- `remove_column(table_name, column_name)` removes a column from the given table.
- `change_column(table_name, column_name, new_data_type)` - changes a column from one data type to another.

To complete the above migration we would want to use the `add_column` method

```ruby
class AddAuthorNameToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :author_name, :string
  end
end
```

Learn more about migrations from the [official rails guides](http://guides.rubyonrails.org/migrations.html)
