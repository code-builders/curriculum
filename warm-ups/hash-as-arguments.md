## Hash Arguments

In ruby hashes are a very powerful tool, but they are also sometimes are to grasp and identify. In this practice you'll use hashes in a few different ways to help solidify some of the nuances.

Normally hashes are wrapped in `{}`, but when hashes are given as an argument to a method they do not include the `{}`, but instead are identified by the key/value syntax (either Ruby 1.9 `a: "b"` or Ruby 1.8 hash rocket `:a => "b"`).

Write a method called `random_value(h)` which takes a hash as an argument, then gives back one of the values at random. The method you make should return a result similar to this example:

```rb
random_value({foo: "bar", boo: "rad"})
 # => "rad"
random_value({foo: "bar", boo: "rad"})
 # => "bar"
```



Use the method in `irb` or a script, play around with the following different ways to give the hash argument to see what happens:

<small>*note that some of the following give errors, how many, which ones and why?*</small>


```rb
# 1 - w/parenthesis & braces
random_value({foo: "bar", boo: "rad"})
```

```rb
# 2 - no parenthesis, w/braces
random_value {foo: "bar", boo: "rad"}
```

```rb
# 3 - no parenthesis, no braces
random_value foo: "bar", boo: "rad"
```

```rb
# 4 - no parenthesis, w/braces assigned to a var
hash = {foo: "bar", boo: "rad"}
random_value hash
```

```rb
# 5 - no parenthesis, no braces assigned to a var
hash = foo: "bar", boo: "rad"
random_value(hash)
```
## Extended Requirements

1. What changes if you change the method to first accept an integer of the number of values you want to return, like `random_value(n, h)`, does this change the way the hash argument can be given?
1. What changes if you change the method to accept an integer after the hash argument? Does this change the way the hash argument can be given?
