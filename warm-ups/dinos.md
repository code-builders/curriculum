# Dinos

Clone the [Dinos Active Record](https://github.com/code-builders/dinos) Rails app
Set up the project by the following:

```bash
cd dinos
bundle install
rake db:create db:migrate db:seed
# creates, migrates, and adds data to the database.
```

In this app there are two models `Dino` and `Egg`. A `Dino` has many eggs, and an `Egg` belongs to a `Dino`. The `db:seed` command entered a bunch of data into both of these tables using the `db/seeds.rb` file.

Go into the `rails console` and query the newly created data using ActiveRecord
to find out the following

Bronze
------

- What is the name of the Dino with a genus of "Protarchaeopteryx"
- Alphabetically by genus, what is the last Dino?
- How many Dinos have a length of less than 20?

Silver
------

- How many Dinos have a genus that ends in "saurus"?
- How many Dinos have a length of less than 20 or a height greater than 20?
- How many eggs have the color "green" in the name?

Gold
-----

- How many eggs does the Dino with genus "Sinosauropteryx" have?
- What is the average height of all Dinos?

Platinum
--------

- How many eggs exist for all of the dinos with a genus which ends in "saurus".
- How many dinos have eggs which have the color "green" in the name?
- Create 10 eggs for each dino which has a genus that contains an "x".
