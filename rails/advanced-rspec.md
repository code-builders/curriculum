# Advanced rspec

Clone this [Bank Repo](https://github.com/code-builders/bank), which roughly has the following applied (you don't need to do the following, it's just there for reference for what the repo has):

```rb
# Gemfile
group :development, :test do
  gem 'rspec-rails', '~> 3.0'
end
```

```sh
rails g rspec:install
rails g model Account name slug
rails g model Transaction amount_in_cents:integer account_id
rake db:create db:migrate
rails g controller accounts
rails g controller transactions
```

Now, we will all use this code base to write some tests:


Fixtures
-------

Fixtures is a way to define sample data for our tests, they are essentially files of YAML that contain the data to create models in the database. We'll start by creating fixtures for our accounts and transactions

```sh
mkdir spec/fixtures
touch spec/fixtures/accounts.yml
touch spec/fixtures/transactions.yml
```

```yml
# spec/fixtures/accounts.yml
checking:
  name: Checking
  slug: checking
savings:
  name: Savings
  slug: savings
```

We've added two sets of sample data to our accounts fixtures, one called `checking` with a name of `"Checking"` and a `slug` of `"checking"`. Next let's create the transactions

```yml
# spec/fixtures/transactions.yml
withdrawal:
  amount_in_cents: -1000
  account: checking
deposit:
  amount_in_cents: 20000
  account: checking  
```

Here we've also defined to fixtures, all of these will act as a base for our test data. It's a best practice to make your fixtures valid, meaning they don't fail any of your validations.

To include a set of fixtures within a test file the `fixtures` keyword is used followed by the fixture file you want to include:

```rb
describe Transaction do
  fixtures :transactions
end
```

Then to refer to a specific fixture, a keyword matching the file name can be used with an argument of the fixture name

```rb
describe Transaction do
  fixtures :transactions
  let(:deposit) { transactions(:deposit) }
end
```

Now let's add some tests

`context`
---------

We've talked about the `describe` and `it` blocks to give the human readable text for tests, we can also use a keyword `context` to give another layer of readability, `context` is generally used when you have the word "When".

```rb
describe Transaction do
  fixtures :transactions
  let(:deposit) { transactions(:deposit) }

  describe "#positive?" do
    context "when amount is positive" do
      it "is true" do
        expect(deposit.positive?).to eq true
      end
    end

    context "when amount is negative" do
      it "is false" do
        expect(deposit.positive?).to eq false
      end
    end

  end
end
```
