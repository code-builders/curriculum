# FarMar Finder

In this assignment we will be creating a tool for use in `irb` to look up Farmers Markets and their related vendors, products, and sales. We will use CSV files as our database.

### Getting Started

For this project we will introduce testing in ruby. We will be using a library called `rspec`, this is the most widely used testing tool for Ruby applications. Start by installing the gem:

```
gem install rspec
```

### Data

There are several CSV data files:

```sh
/support/markets.csv
/support/products.csv
/support/vendors.csv
/support/sales.csv
```    

### Expectations

Build classes to query the CSV data including objects and methods listed below. Before going too deeply into the methods listed, start by building a system to read the csv files and turn each row of data into an instance of the corresponding ruby class.

To namespace our data classes we will use a file named `/lib/far_mar.rb`

```rb
# lib/far_mar.rb
require 'csv'

module FarMar
end

require_relative 'far_mar/market'
require_relative 'far_mar/vendor'
# ... require all needed classes
```

```rb
# lib/far_mar/market.rb
class FarMar::Market

end
```

With this `FarMar` module name-spacing and requiring all of the files, running the following to start `irb` should load everything in order to use the tool:

```sh
irb -r ./lib/far_mar.rb
```

The completed product will be used in `irb` as a developer tool to access the data from farmers market CSV's.

### Assignment

**Shared Methods:**

For each of the data classes build the following methods:

- `self.all` - returns all rows of the CSV file as objects
- `self.find(id)` - returns the row where the ID field matches the argument

**Unique Market Methods**

- `vendors` - returns a collection of `Vendor` instances that are associated with the market by the market_id field.
- `find_by_state(state_name)` - Returns the first `Market` object with a state name which matches the input
- `find_by_state(state_name)` - Returns a list of all `Market` objects with a state name that matches the input

**Unique Vendor Methods**

- `market` - returns the `Market` instance that is associated with this vendor using the `Vendor` `market_id` field
- `products` - returns a collection of `Product` instances that are associated with market by the `Product` `vendor_id` field.
- `sales` - returns a collection of `Sale` instances that are associated with market by the `vendor_id` field.
- `revenue` - returns the the sum of all of the vendor's sales (in cents)
- `self.by_market(market_id)` - returns a list of all `Vendor` objects with a market id that matches the input
- `company_size` - returns the size of the company using the following rules:
  - 1-3 `"Family Business"`
  - 4-15 `"Small Business"`
  - 16-100 `"Medium Business"`
  - 101+ `"Big Business"`

**Unique Product Methods**

- `vendor` - returns the `Vendor` instance that is associated with this vendor using the `Product` `vendor_id` field
- `sales` - returns a collection of `Sale` instances that are associated with market using the `Sale` `product_id` field.
- `number_of_sales` - returns the number of times this product has been sold.
- `self.by_vendor(vendor_id)`- returns a list of all `Product` objects with a vendor id that matches the input


**Unique Sale Methods**

- `vendor` - returns the `Vendor` instance that is associated with this sale using the `Sale` `vendor_id` field
- `product` - returns the `Product` instance that is associated with this sale using the `Sale` `product_id` field
- `self.between(beginning_time, end_time)` - returns a collection of Sale objects where the purchase time is between the two times given as arguments
- `self.by_product(product_id)` - returns an `Array` of `Sale` objects with a `product_id` matching the argument.
- `self.by_vendor(vendor_id)` - returns an `Array` of `Sale` objects with a `vendor_id` matching the argument.

### Testing

To run our the whole test suite:

```
rspec
```

To run a tests on a single class:

```sh
rspec spec/lib/far_mar/market_spec.rb #replace file name for a different class
```

I recommend starting testing with just the `market_spec.rb`, and moving on to the next class when the errors start referring to another class.

Note: Our test suite will run tests to ensure that *most* of our required methods are implemented correctly.

## Evaluation

You will be evaluated on:

- Running `rspec` from Terminal with no failures
- Demonstrating, in IRB, a few of the methods listed above (asked at random).
- Code quality (is your code organized and logical)

### Extended Requirments

- Write additional (creative) methods to add neat functionality
- Add a `FarMar::Base` class which all other classes inherit from which holds the shared methods.
- Write additional specs


---------

## More Info

### Classes

Our supporting classes will also live in the `/lib` dir.

#### Market

The Market data, in order in the CSV, consists of:

1. ID
2. Name
3. Address
4. City
5. County
6. State
7. Zip

An individual market has many vendors

#### Vendor

The Vendor data, in order in the CSV, consists of:

1. ID
2. Name
3. No. of Employees
4. Market_id

Each vendor belongs to a market, the market_id field relates to the Market ID field.
Each vendor has many products they sell.

#### Product

The Product data, in order in the CSV, consists of:

1. ID
2. Name
3. Vendor_id

Each product belongs to a vendor, the vendor_id field relates to the Vendor ID field.

#### Sale

The Sale data, in order in the CSV, consists of:

1. ID
2. Amount (in cents)
3. Purchase Time
4. Vendor_id
5. Product_id

Each sale belongs to a vendor AND an product, the vendor_id and product_id fields relates to the Vendor and Product ID fields
