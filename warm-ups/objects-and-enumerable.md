## Objects with Arrays

Copy the `User` class below which has the attributes `id`, `email`, and `username`. The `.initialize` is setup to accept an Array of attributes in a defined order.
```rb
class User
  attr_accessor :id, :email, :username
  def initialize(attrs=[])
    @id       = attrs[0]
    @email    = attrs[1]
    @username = attrs[2]
  end
end
```

Load the class into `irb` then practice the following:

1. Using the array `[1, "fritz@example.com", "Fritz"]` initialize a new instance of `User`
1. Make up your own array to initialize an instance of a `User`
1. Still in `irb` copyt the array below and use the `.map` method to create an array of `User` objects (assign to a variable)
```rb
[[1, "fritz@example.com", "Fritz"],
[7, "clara@example.com", "Clara"],
[4, "angel@example.com", "Angel"],
[3, "sugar_plum@example.com", "SugarPlumFairy"],
[5, "owl@example.com", "Owl"],
[6, "mouse@example.com", "Mouse"],
[2, "the_king@example.com", "MouseKing"]]
```

Using the variable assigned to the Array of `User` objects do the following using `Enumerable` methods:

1. Sort the `User` objects alphabetically by `username` (`.sort_by`)
1. Find the user with the most characters in their email address (`.max_by`)
1. Find the user with the id of 5 (`.find` or `.detect`)
1. Find all users with `Mouse` in their username (`.find_all` or `.select`)
1. Create an Array of all email addresses (`.map` or `.collect`)
1. Use `group_by` to group the users where id is less than 5.

Use the `.map` method on the array below to create a new array of `User` objects.
