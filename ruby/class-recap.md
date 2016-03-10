Classes
-------

Classes in ruby are global constants using the camel-cased naming convention. So when a class is defined, it it *globally* available within the ruby program. Classes are used to encapsulate logic tied to a single idea, an organization strategy for programming languages.

Classes are typically defined with the `class` keyword:

```rb
class Pineapple
end
```

This simple statement will create the global `Pineapple` class, which can now be used anywhere.

With any class, there are two types of objects you can use, the class itself and instances of that class.

```rb
Pineapple # => This is using the class itself

p = Pineapple.new
p # => This is an instance of the class.
```

There is only 1 class object of each class, while you can make any number of unique instances of a class. So can break up ideas into two distince sections.

Class Methods
------

Class methods are methods called directly on the class object `Pineapple.whatever`, generally these methods deal with creating instances, generic functional tasks, or anything that you would consider doing to a collection. The `.new` method is the class method we use most often. In Rails `ActiveRecord` gives us tons of class methods such as `find`, `where`, `all`, `joins`, `includes`, `first`, etc...

Defining class methods is less common, but still very useful. Class methods are still defined with `def`, but the method name is prepended with `self.`:

```rb
class Tweet

  def self.refresh
    # Code which talks with twitter api,
    # and creates instances based on results
  end
  
end
```

Instance Methods
---------

Instance methods are used on objects initialized by the class, all instance of a class have the same methods. These methods typically defined state and behavior for an instance. Within instance methods we commonly use instance variables to keep track of attributes that the instance has stored. 

In the process of creating an instance, ruby always runs a method called `#initialize` immidietly after creating the instance, this method is commonly redefined by the developer to do the initial setup of an instance, this is called a constructor.

On top of that methods are defined with `def methodname`:

```rb
class Tweet
  def initialize(text, username)
    @text     = text
    @username = username
  end

  def text
    @text
  end

  def from_user?(u)
    @username == u
  end
end
```

```rb
tweet = Tweet.new("This is a tweet", "code_builders")
tweet.text # => "This is a tweet"
tweet.from_user?("Bookis") # => false
```
