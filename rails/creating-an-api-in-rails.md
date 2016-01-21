# Creating an API in Rails

Let's build a small Rails app that will act as an API for providing data about our amazing, adorable pets to other applications. The app will have the following routes:

- `/pets` show all pets
- `/pets/:id` shows a pet with the provided id
- `/pets/search?query=<the search term>` fuzzy searches pets by name, shows all matching pets

We'll end by adding some tests to this application. So we'll need a fresh sandbox to play in, plus a boilerplate Rails/Rspec install. Start by cloning the following repo:

```bash
git clone https://github.com/code-builders/pets
cd pets
bundle
rake db:create db:migrate db:seed
```

Let's take a moment and walk through what we've got.

If we try to load the home page we'll get an error like:

```bash
Missing template pets/index, application/index...
```

Since we are building a JSON api, we don't want to render an html template (or really use any of the view layer). Instead we want to return the requested data in a standard format. Using the `render` method in the controller, we can choose to return json:

```ruby
# pets_controller.rb
def index
  @pets = Pet.all
  render json: { foo: "bar" }
end
```

Here we don't actually write json. We provided a plain Ruby hash and let Rails do the conversion for us (with the `render json:` call. Rails can also automatically convert instances of models into JSON with all of the data from the instances:

```ruby
# pets_controller.rb
def index
  pets = Pet.all
  render json: pets
end
```

Now curl gives us output that looks like:

```json
[
    {
        "breed": "Domestic Long Hair",
        "created_at": "2016-01-21T16:30:28.223Z",
        "human": "Kelsi",
        "id": 1,
        "name": "Urchin Jr",
        "species": "Cat",
        "updated_at": "2016-01-21T16:30:28.223Z"
    },
    {
        "breed": "Domestic Long Hair",
        "created_at": "2016-01-21T16:30:28.235Z",
        "human": "Mothra",
        "id": 2,
        "name": "Siberian Husky",
        "species": "Cat",
        "updated_at": "2016-01-21T16:30:28.235Z"
    },
    {
        "breed": "Domestic Long Hair",
        "created_at": "2016-01-21T16:30:28.238Z",
        "human": "Mothra",
        "id": 3,
        "name": "Himalaya",
        "species": "Cat",
        "updated_at": "2016-01-21T16:30:28.238Z"
    }
]```

### as_json
`ActiveRecord` provides a great method for presenting models as json objects. It's called, as you may have guessed, `as_json`. Let's give it a try:

```ruby
# pets_controller.rb
class PetsController < ApplicationController

  def index
    pets = Pet.all
    render json: pets.as_json(except: [:created_at, :updated_at])
  end
end
```

This simplifies our output a bit:

```json
[
    {
        "breed": "Domestic Long Hair",
        "human": "Kelsi",
        "id": 1,
        "name": "Urchin Jr",
        "species": "Cat"
    },
    {
        "breed": "Domestic Long Hair",
        "human": "Mothra",
        "id": 2,
        "name": "Siberian Husky",
        "species": "Cat"
    },
    {
        "breed": "Domestic Long Hair",
        "human": "Mothra",
        "id": 3,
        "name": "Himalaya",
        "species": "Cat"
    }
]
```

### Response Codes

We've built a simple API that responds with some data. We could let the consumer of our API parse that data to figure out if their request was successful or if there was an error of some sort, but that seems like cumbersome for them. Instead, we can use HTTP status codes to provide a quick and easy way for our API's users to see the status of their request.

To set status code in your controller, just pass `:status` to our render method.

```ruby
def index
  pets = Pet.all
  render json: pets.as_json(except: [:created_at, :updated_at]), status: :success
end
```

Notice in the example above, I used both `:success` as well as the official numeric value of 200 to inform the consumer that the request was a success. I tend to use the built-in Rails symbols for this, as they're more explicit, however its good to know at least the most common [HTTP status codes](http://en.wikipedia.org/wiki/List_of_HTTP_status_codes).

+ 200 - :ok
+ 204 - :no_content
+ 301 - :moved_permanently
+ 400 - :bad_request
+ 401 - :unauthorized
+ 403 - :forbidden
+ 404 - :not_found
+ 410 - :gone
+ 422 - :unprocessable_entity
+ 500 - :internal_server_error

### show
Let's add this same approach for the show action, start by adding a route, then updating the controller:

```ruby
# pets_controller.rb
def show
  pet = Pet.find(params[:id])
  render json: pet.as_json(except: [:created_at, :updated_at])
end
```

#### What if we can't find a pet?
What if we get params that don't match a pet? What do we do? How should our code change? At the very least, we should make sure that we don't throw an error. Also, we should return a status code that indicates to the consumer (which is another service) that we couldn't find any content to match their request. Fortunately, the `204` status code exists for exactly this reason. Let's change our `show` method to:

```ruby
def show
  pet = Pet.find_by(id: params[:id])

  if pet
    render json: pet.as_json(except: [:created_at, :updated_at]), status: :ok
  else
    render json: [], status: 204
  end
end
```

## Activity
1. Write at least one positive (search found pets) and one negative (search didn't find pets) test.
1. Implement the search feature in the `Pet` model
1. Create a route and controller action for searching for a pet by name
1. Make the action return a collection of pets as json

## Resources
- [`.as_json` documentation](http://api.rubyonrails.org/classes/ActiveModel/Serializers/JSON.html#method-i-as_json)
- [ActiveModel Serializers](http://railscasts.com/episodes/409-active-model-serializers)
- [blog post by thoughtbot about serialization](http://robots.thoughtbot.com/better-serialization-less-as-json)
