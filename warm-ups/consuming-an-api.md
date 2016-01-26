# Pet API

Use a Ruby tool such as [HTTParty](https://github.com/jnunemaker/httparty) to make a request to our pet API. In `irb`:

- Try the `index` response to get a list of pets (https://cb-pets.herokuapp.com)
- Try the `show` response to get a single pet by id (https://cb-pets.herokuapp.com/pets/:id)

Next make a plain `Pet` which has the following attributes:

- `id`
- `name`
- `species`
- `breed`

class which uses `HTTParty` to get these same resources:

- `self.find(id)` Does a request to https://cb-pets.herokuapp.com/pets/:id, then creates a new instance of `Pet` for the single result
- `self.all` - Does a request to https://cb-pets.herokuapp.com, then creates new instances of the `Pet` class for each result returned
