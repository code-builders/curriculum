# Has Many

We'll take a more in-depth look at the `has_many` function for ActiveRecord. `has_many` specifies a one-to-many association. Examples of this would be

- A Market has many vendors
- A Vendor has many products
- A Menu Section has many menu items
- A User has many tweets

This idea of one-to-many, parent to children, relationship is not unique to Rails, this is a construct of all databases. In a database this idea if implemented by adding a column to the child table which corresponds to the `id` column of the parent table

#### User
| id     | username     |
| :------------- | :------------- |
| 22       | Kelly       |
| 35       | Boo       |

#### Tweet
| id | body | user_id |
|:-:|:-------------|:------------- |
|1| I love cats       | 35       |
|2| Cats rule!!!1!       | 35       |
|3| Puppies       | 22       |
|4| Science is cool       | 22       |

In this example each user, Kelly and Bookis each have two tweets. If we wanted to find the tweets of Kelly, we could find from the Tweet table where the `user_id = 22`. If we wanted Boo's we could find where the `user_id = 35`. This encapsulates the idea of a one-to-many relationship. A user **has many** tweets.

## In Rails

This idea is so common that Rails has a robust approach to taking advantage of this idea. If we have these models within a rails app

```sh
rails new twitter -T -d postgresql
cd twitter
rails g model User username:string
rails g model Tweet body:text user_id:integer
rake db:create db:migrate
```

Now open Rails console and create some records

```rb
User.create(username: "Kelly")
User.create(username: "Boo")
Tweet.create(body: "I love cats", user_id: 1)
Tweet.create(body: "Cats rule!!!1!", user_id: 1)
Tweet.create(body: "Puppies!", user_id: 2)
Tweet.create(body: "Science is cool", user_id: 2)
```

First we are going to look at the manual way to find the records (without the built in `has_many`). We can recreate the logic we mentioned above to find the associated records

```rb
kellys_tweets = Tweet.where(user_id: 1)
boos_tweets = Tweet.where(user_id: 2)
```

Now we can add the built in `has_many` method to take advantage of this. In the `user.rb` model

```rb
class User < ActiveRecord::Base
  has_many :tweets
end
```

The `has_many` class requires one argument which is the snake-case plural name of the child resource.

Now if we `reload!` our console we can take advantage of the added functionality.

```rb
kelly = User.find(1)
kelly.tweets
# This method is added by `has_many` and it's doing the same as Tweet.where(user_id: 1)
kelly.tweets.to_sql
User.last.tweets
```

Rails also provides easy ways to insert records in the database while keeping track of the associated `user_id`:

```rb
kelly.tweets.create(body: "I'm having fun!")
# creates a tweet with a user_id of kellys

kelly.tweets << Tweet.create(body: "What is the meaning of life?")
# Same as above

tweet = kelly.tweets.new(body: "Who am I?")
tweet.save
# And still the same.

kelly.tweets.count
kelly.tweets.empty?
kelly.tweets.destroy_all
kelly.tweets.where(body: "Puppies!")
```
