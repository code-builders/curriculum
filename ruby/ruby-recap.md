# Ruby Recap

Hashes
------
Hashes in Ruby are the most confusing while often used object. A Hash in Ruby is equivalent to a Dictionary in Python and an Object in Ruby. In all of these languages the hash literal is two curly brackets `{}`. The principle is the same in all languages. A Hash is an *unordered list*, which means un-indexed. Instead of an index this lists values are tracked by arbitrary keys.

```rb
sample_array = ["Cat", "Dog", "Bird"]
# In an array we get a value by index
sample_array[1] # => "Dog"

sample_hash = [inside_pet:  "Cat", outside_pet: "Dog", cage_pet: "Bird"]
# In an array we get a value by key
sample_hash[:outside_pet] # => "Dog"
```

These two ideas are largely the same, both `Array` and `Hash` are lists, but we store and access the values in different ways.

| Class | Type | Ordered | Access By     |
| :---: | :--: | :--: | :---: |
| Array | List | true | index |
| Hash | List | false | arbitrary key |

#### Syntax

Hashes have some nuanced syntax, in the end it makes our code cleaner, but a bit hard to get used to:

1. Curly brackets are optional in some cases
1. When given as an argument to a method without parenthesis, curly brackets *cannot* be used.
1. There are two different syntax for Hashes, the hash rocket (old way) and the reverse symbol (new way)
1. Anything can be a key of a hash, but typically a `Symbol` is used.

Here are examples of those:

```rb
# 1.
User.new name: "Boo", age: 30
# here the method `new` is given a hash as an argument, but this hash doesn't have curly brackets.

# 2.
User.new {name: "Boo", age: 30}
# ERROR! When using curly brackets for a hash as an argument to a method without parenthesis, ruby interprets the curly brackets as a block. Instead use no curly brackets like in #1

# 3.
{"old_way" => "This is a hash rocket", new_way: "This is a reverse symbol"}
# The new reverse symbol approach only allows for keys to be symbols.

# 4.
weird_hash = {nil => "The key is nil, this is valid", true => "They key is true"}
weird_hash[true]
# The keys can be any ruby object, but symbols (and strings) are typically used. To make anything other than a symbol a key, the hash rocket syntax must be used

```

Classes
-------

attr_accessor
-------------

self
-----

Enumerable
----------
