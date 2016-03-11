# Defining Blocks

In Ruby we've used blocks quite a bit, anytime we iterate we use a block. But blocks aren't just used for iteration, they can be used for many scenarios, We see it in other places as well, such as the routes file:

```rb
SomeApp::Application.routes.draw do

end
```

A block is a chunk of code that can be passed into a method, this is similar to the idea of functions as objects in Javascript, but in ruby the chunks of code can't be assigned to a variable, they must be defined immediately after the method is called. Blocks are another example of something in ruby that is not an Object.

So, we've used blocks, let's look at how to define them:

```rb
def politely_say
  puts "Ahem..."
  puts yield
  puts "That's all. Thank you"
end

politely_say do
  "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
end
```

We define a method normally, any method can take a block, inside of the method we can use the keyword `yield`, this will trigger the code within the block. We can also pass arguments to the yield, these arguments become the values in the `||`:

```rb
def do_math(x,y)
  yield(x,y)
end

do_math(3,5) do |x,y|
  x ** y
end
```

Blocks can be useful for many things, any type if iteration is the most useful way to use them. Another is to create and encapsulate a context, this is commonly seen in configuration blocks for many tools, for example the Twitter gem configuration:

```rb
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "YOUR_CONSUMER_KEY"
  config.consumer_secret     = "YOUR_CONSUMER_SECRET"
  config.access_token        = "YOUR_ACCESS_TOKEN"
  config.access_token_secret = "YOUR_ACCESS_SECRET"
end
```

This creates a scope where the `config` variable is available to modify, but once the block is closed that variable is gone, this is ideal for configuration scenarios to ensure that the `config` variable is not unintentionally modified where it's not supposed to be. It also just looks cleaner and nicer then passing in such a long argument hash.

If we were to imagine the definition of this initialize, it could look something like:

```rb
class Twitter::REST::Client
  attr_accessor :consumer_key, :consumer_secret, :access_token, :access_token_secret

  def initialize
    yield(self)
  end
end
```

Seems pretty magic, but let's walk through it line by line. `config` is the argument, in initialize the object passed to the block is `self`, in this case `self` would be the instance itself, so in the block `config` is the instance we just made and we are assigning attributes defined in `attr_accessor`.

Let's look at another example of how `.each` might work by making a `FakeArray` class:

```rb
class FakeArray

  def initialize(*values)
    @values = *values
  end

  def each
    index = 0
    while index < @values.size
      yield(@values[index])
      index += 1
    end
  end

end
```
