## Initialize

Create a `Product` class (plain ruby, not rails) with the following `attr_accessor`s

- `name`
- `description`
- `price_in_cents`
- `quantity_in_stock`

Create three different versions of this class, each using a unique approach to assigning the initial values within `initialize`.

```rb
# an ordered list of four separate arguments
Product.new("Rubik's Cube", "A fun toy", 699, 100)

# a single hash argument
Product.new(name: "Rubik's Cube", price_in_cents: 699, description: "A fun toy", quantity_in_stock: 100)

# a single ordered array argument
Product.new(["Rubik's Cube", "A fun toy", 699, 100])
```


### Extended Requirements

Add the following instance methods to the `Product` class:

1. `.in_stock?` - returns `true` or `false` depending if the `quantity_in_stock` is > 0
1. `.formatted_price` - returns a string format of the price (`"$6.99"`)
1. `.buy!(n)` - reduces the stock by n amount, default to 1 if no argument is given. If more are bought then in stock, it should `raise` an error with the message `"Only x in stock, please adjust your order."`
