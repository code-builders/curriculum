# Ruby 102
### More of the basics
We're going to review some of the most basic and common Object types within Ruby.

`String`
------
Ruby strings are a sequence (or array) or characters, if this sentence were evaluated
by ruby it would be a `String`. Let's go into `irb` by typing `irb` in the terminal and type some of these out:

```ruby
"Hello World"
# => "Hello World"

"Kit" + "tens" + "!"
# => "Kittens!"

"-" * 40
# => "----------------------------------------"

"Bookis".reverse
# => "sikooB"

"I'm thirty one characters long!".length
# => 31
```

Check out the [Documentation for String](http://www.ruby-doc.org/core-2.2.3/String.html) to see other things that you can do to a String

#### Single or Double Quotes?
Either work, they do have some differences, double quotes interpolate special characters.
For example `\n` is a special character for a new line. Using double quotes will allow this character to be evaluated.

```ruby
puts 'abc\nabc'  # => abc\nabc
puts "abc\nabc"  # => abc
                 #    abc
```

Additionally double quotes allow you to interpolate ruby directly into the string. Within double quotes you can use `#{}` to encapsulate ruby code. This is usefule when we have a variable that is a string we want within a sentence:

```
name = "Boo Radley"
'Hi, my name is #{name}' # => "Hi, my name is \#{name}"
"Hi, my name is #{name}" # => "Hi, my name is Boo Radley"
```

One gotcha is that if you use a double quote inside of a string with double quotes ruby will get confused, it thinks you're ending the string. You can avoid this by **escaping** the double quote character:

**Escaping** is when a special character is used to alter the interpretation of the following character. In Ruby the escape character is a backslash. So using a backslash before a double quote escapes the double quote, altering it so that it acts as a character within the string rather than a double quote ending the string. To best understand, look at this example:

```ruby
puts "\"Hello\" I said"
# "Hello" I said
# => nil
```

Use double quotes by default, this gives the most flexibility and it's more common that
you'd need to use a `'` inside of a sentence than a `"`. If you want to use a double quote

`Symbol`
--------
Symbols are a lot like strings but they are meant to represent names (short strings), basically it's text that is meant only for keeping track of the name of something inside of a ruby application. An identifier.

Here are some requirements for when it's ok to use a symbol:
- An internal string, not meant to be displayed to a user
- Not created by user input
- Short

And here are some common places to use symbols:
- As a key in a hash
- As a text argument to a method

Why?

The easiest and shortest answer is performance.

```ruby
:boo # => 483528
:boo.class # => Symbol
```

`Numbers`
--------
Numbers are pretty obvious, but maybe not as simple as you might think. Numbers can be a few different datatypes, the most common in ruby are Integer and Float.The most obvious difference is the decimal point.

`Integer` objects are whole numbers (`1`, `9999`, `-255`) and are most commonly used.

`Float` objects are numbers with a decimal point (`3.14`, `0.001`) and are most often used for mathmatics.

Use Integers unless you have a specific reason not to.

```ruby
10 * 10
 # => 100
2 / 3
 #=> 0
2.0 / 3.0
 # => 0.66666666666
# Notice Integers and Floats share many arithmetic methods,
# but they won’t always produce the same result.

2.4 * ((100/99.88) * 4.2**8) - 77
 # => 232585.84332597523
# Also notice that you can even mix and match Integers and Floats
# (be careful, you may not always get the type that you expect back)
```

Check out the Documentation for [Integers](http://www.ruby-doc.org/core-2.2.3/Integer.html) and [Floats](http://www.ruby-doc.org/core-2.2.3/Float.html).

Collections
-----------
Were going to talk about the two most common collection types in Ruby, `Array` and `Hash`.

### `Array`

An `Array` is an ordered collection of any object types

```ruby
[1, "hello", 3.14]
```

Some things to note:

1. We created the `Array` simply by using `[]`.
2. The objects within the array are not all of the same type, we have an `Integer`, `String`, and `Float`

(other languages such as Java don't allow you to put multple types of objects in one list)

Arrays are integer-indexed, what this means is that each item in the array corresponds to an integer
value. and that integer is used to access an object within the `Array`. The first object is assigned
0 and increments up from there. Ruby also allows for negative indexing, so -1 corresponds to the
last element, -2 the second to last and so on.

```ruby
a = [1, "hello", 3.14]
a[0] # => 1
a[1] # => "hello"
a[2] # => 3.14
a[-1] # => 3.14
```

### `Hash`

A `Hash` is a lot like an array, it is a collection of key/value pairs:

```ruby
{first_num: 1, greeting: "Hello", pi: 3.14}
```

This doesn't seem a lot like an `Array`, but if you think of the key of the key/pair as the index
they have a lot more in common. In this above case, we have the equivelant of an `Array` with `[1, "hello", 3.14]`
but instead of the indices 0,1,2, we use first_num, greeting, pi.

```ruby
h = {first_num: 1, greeting: "Hello", pi: 3.14}
h[:first_num] # => 1
h[:greeting] # => "Hello"
h[:pi] # => 3.14

```

Look at the Ruby docs for [Array](http://www.ruby-doc.org/core-2.2.3/Array.html) and [Hash](http://www.ruby-doc.org/core-2.2.3/Hash.html) for more info

Note: `Hash` and `Symbol` are required learning, but we will do individual lessons on those topics to introduce the specific ideas which are required.


## .rb

A quick note about ruby files. We've been coding in `irb` so far, but `irb` is mostly used for a quick playground to try things out, typically code will be written in ruby files. A ruby file has the extension `.rb`, which is the only requirement for the file. When you write code in a Ruby file, you have to "run" that file to execute the code, but unlike `irb` you won't see anything happen unless you use `puts` or `print`. Let's try to put some code in a file (and take a quick look at the `.inspect` method)

Resources
---------
- http://www.ruby-doc.org/core-2.2.3/String.html
- http://www.ruby-doc.org/core-2.2.3/Integer.html
- http://www.ruby-doc.org/core-2.2.3/Float.html
- http://www.ruby-doc.org/core-2.2.3/Array.html
- http://www.ruby-doc.org/core-2.2.3/Hash.html
