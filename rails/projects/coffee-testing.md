# Coffee Testing

In this project you will create a rails app for the sole purpose of testing. Use rspec to test the following components of the app:

1. `Cafe` model (or name it whatever, `Coffee` apparently is used by `CoffeeScript`)
  - `name` attribute
  - `origin` attribute (country)
  - `roast` attribute
  - `#dark_roast?` does the `roast` attr have the word `"dark"` in it?
  - `#medium_roast?` does the `roast` attr have the word `"medium"` in it?
  - `#light_roast?` does the `roast` attr have the word `"light"` in it?
  - `.rating` - Returns a `Float` of the average of all ratings for this coffee (this one can be done after the `Rating` model below)
1. `CafeController` controller with the following:
  - `GET index` method which shows all added coffee
  - `GET show` method which shows a single coffee instance
  - `DELETE destroy` method which destroys a coffee instance from the db
  - `POST create` method which creates a new coffee instance in the db
  - `GET new` method which shows the form for POSTing coffee info
1. Basic views for all of the controller actions
1. `Rating` model
  - `cafe_id` attribute - a rating belongs to a cafe
  - `score` attribute - the rating of `0-10`
  - `.average` returns an `Float` of the average scores for all Ratings

## V2

1. `Cafe`
  - `#continent` Returns the continent from the country of origin
    - Use something like https://github.com/hexorx/countries
    - If the continent can't be determined because of an incorrect country name, return `nil`
  - `light_roast?`, `medium_roast?` and `dark_roast?` research common names for each roast and update these methods to include words such as `French` for `dark_roast?`
