# Beginning rspec in rails

To add rspec to any rails project, add the `rspec-rails` gem in the gem file in the `:development, :test` group:

```rb
group :development, :test do
  gem 'rspec-rails'
  gem 'byebug' # this should already be there
end
```

Then `bundle install`. Next we can run a generator to create all of the initial files and configuration

```sh
rails g rspec:install
```

Now anytime we use any other rails generator it will create the appropriate spec files with some boilerplate code in the file.

```sh
rails g model Pet name human breed species
# this will also create /spec/ odels/pet_spec.rb
```
Writing model specs
------------

Writing a model spec is nearly the same in rails as writing a spec for a regular ruby class.

```rb
require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe "validations" do
    it "is invalid without a name" do
      pet = Pet.new(name: nil)
      pet.save
      expect(pet.errors[:name]).to include "can't be blank"
    end
  end
end

```
Writing a controller spec
------------

Controllers have a bit more complexity, a request needs to be simulated, then a mocked response is tested for results:


```rb
require 'rails_helper'

RSpec.describe PetsController, type: :controller do
  describe "GET to index" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end
end
```
