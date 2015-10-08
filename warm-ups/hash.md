# Build a Hash

Single level
------------

Build a hash which describes your favorite book. Make all of the keys symbols and all of the values either strings or integers. To get started here is a small sample of mine:

```rb
book = {
  title: "The Caves of Steel",
  pages: 224,
  publication_date: "June 1954",
  author: "Isaac Asimov"
}
```

Add as many descriptive keys as you can think of.

### Practice in `irb` with this hash

1. What code could you write to access a value in your hash (i.e. `224`)?
1. Change all of the keys to strings rather than symbols, how does the syntax need to change?
1. How can you determine how many key/value pairs are within the hash
1. Using the [Hash documentation](http://ruby-doc.org/core-2.2.2/Hash.html), what is one interesting method that you can find for a Hash?

Before moving on, try this same exercise but describing an object of your choice.

Multi-Level
-----------

Build a hash which describes your favorite movie. Make all of the keys symbols, but this time make some of the values arrays and other hashes where it makes sense. Here is an example of mine:

```rb
movie = {
  title: "Triangle",
  starring: ["Melissa George", "Michael Dorman", "Rachael Carpani"],
  finances: {
    budget: "12 Million",
    box_office: "1.6 Million"
  }
}
```
Add as many descriptive keys as you can think of.

### Practice in `irb` with this hash

1. What code could you write to access a value in your hash (i.e. `"Triangle"`)?
1. What code could you write to access a nested value in your hash (i.e. `"12 Million"`)?
1. Change all of the keys to strings rather than symbols, how does the syntax need to change?
1. How can you determine how many key/value pairs are within the hash?
1. Are each value in a nested array or hash counted in the number of key/values?

Try this same exercise but describing an object of your choice.
