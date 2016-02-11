# Hash First Letter

Create a class which takes a hash on initialize. Create a method called `key_with_letter(l)`, which takes one argument which is a letter. The method will return the value of a key (if it exists) which starts with the letter given as an argument. Example:

```rb
fl = FirstLetter.new({boo: "who", moo: "cow"})
fl.key_with_letter("m") # => "cow"
fl.key_with_letter("a") # => nil
fl.key_with_letter("b") # => "who"
```

Extended Requirements
-----------

- Do the same in Javascript
- Do the same in Python
