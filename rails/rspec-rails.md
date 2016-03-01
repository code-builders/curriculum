# Rspec in Rails

There are several types of tests that can be written for any system, generally these are broken out into different sections (although the definition of each section can be a bit gray). There are three major types of tests we'll focus on:

1. Unit
  - Testing each individual method (models, pure classes)
1. Integration (Service)
  - Testing combined components (routes, controllers, model interactions)
1. Feature (UI)
  - Front end testing by automating browser actions

![Testing Pyramid](pyramid.png)

These types of tests are often represented as a pyramid, like a the food pyramid, Unit tests are the base, these are the best for step, easiest to write, and help with structure of code. Next are the integration tests, there doesn't need to be as many of these tests, but still each interaction (route) is testing individually. Then feature tests, there only needs to be a few of these, a single test can test a whole set of related user interactions (like logging in may take many steps, but can be tested in a single test).

## Getting Started

Install rspec by adding to the Gemfile:

```rb
group :development, :test do
  gem 'rspec-rails'
end
```

`bundle install` then `rails g rspec:install`

Next we'll install a tool which automatically runs your tests anytime a file is saved, in the Gemfile:

```rb
group :development, :test do
  gem 'rspec-rails'
  gem 'guard-rspec', require: false
end
```

In the Terminal `bundle install` then `guard init rspec`, then use `guard` to start the tests (this will start a process which takes over the Terminal tab to run tests, so open a new tab)

## Unit tests

In rails unit tests typically refer to testing models, but this could also be for any custom classes (such as an API wrapper) or helper classes:

```rb
# spec/models/drink_spec.rb
require 'rails_helper'

RSpec.describe Drink, type: :model do
  let(:drink) { Drink.create(name: "Coffee", origin: "Peru", roast: "Super Dark")}
  describe `#validates` do
    it "the presence of the name" do
      drink.update(name: nil)
      expect(drink.valid?).to eq false
    end
  end

  describe "#light_roast?" do
    context "when given dark" do
      it "returns false" do
        expect(drink.light_roast?).to eq false
      end
    end
  end
end
```

## Integration/Functional tests

Integration tests are used to test whole components of the app working together. According to the rails guide to testing this would be used to test:

- was a web request successful?
- was a user redirected to the right page?
- was a user successfully authenticated?
- was a correct object stored in the response template?
- was a appropriate message displayed to the user in the view?

Typically this is testing the controllers:


```rb
require 'rails_helper'

RSpec.describe DrinksController, type: :controller do
  describe "GET index" do
    it "returns a 200" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "POST create" do
    it "creates a Drink" do
      count = Drink.count
      post :create, drink: {name: "Blah", roast: "Light", origin: "Brazil"}
      expect(Drink.count).to eq count + 1
    end
  end
end

```

Resources
---------
- [Rails Guide](http://guides.rubyonrails.org/testing.html)
- [Better specs (a great list of best practices)](http://betterspecs.org/)
- Cheat sheets:
  - [General](http://www.cheatography.com/mpicker0/cheat-sheets/rspec-3-expectations/)
  - [General 2](http://www.anchor.com.au/wp-content/uploads/rspec_cheatsheet_attributed.pdf)
  - [Rails rspec](http://ricostacruz.com/cheatsheets/rspec-rails.html)
  - [Rails examples](https://github.com/eliotsykes/rspec-rails-examples)
  - [Controllers](https://gist.github.com/eliotsykes/5b71277b0813fbc0df56)
