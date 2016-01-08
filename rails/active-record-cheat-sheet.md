# ActiveRecord


Queries for single instances
-------

Finding a single instance by `id`

```rb
User.find(1)

Post.find(50)

User.first
User.second
User.third # ...

Post.last
```
Finding a single instance by any column(s) but `id`

```rb
User.find_by(username: "hgwells")

User.find_by(email: "hg@wells.com")
```

Any column in the database can be used with find_by

```rb
User.find_by(username: "hgwells", email: "hg@wells.com")
```

If multiple records match the query, only the first found will be returned

```rb
Post.find_by(visible: true)
```

Queries for many instances
-------

Finding all instances of a class

```rb
User.all

Post.all
```

Finding all instances by any column(s)


```rb
Post.where(private: true)

Post.where(private: false, title: "How to use ActiveRecord")
```

Finding all instances by any columns using multiple lines

```rb
posts = Post.where(private: false)
posts = posts.where(title: "How to use ActiveRecord")
```

Ordering
--------

Ordering by any column(s)
```rb
User.order(username: :asc) # alphabetical ascending
User.order(username: :desc) # alphabetical descending

Post.order(publish_at: :asc) # by date ascending
Post.order(publish_at: :desc) # by date descending

Post.order(publish_at: :desc, title: :asc) # by date descending then title ascending
```

Limiting
--------

Get `n` number of instances (similar to `.all` but only for `n` amount)

```rb
Post.limit(10)
User.limit(1)
```

Combining Queries
-----------------

All of the above methods can be combined for more power


```rb
Post.where(visible: true).order(publish_at: :desc)

# When combining queries, order doesn't matter.
# It's like a kinked hose, ActiveRecord doesn't
# talk to the database until all queries are built up
Post.order(publish_at: :desc).where(visible: true)

Post.where(visible: false).limit(3).order(title: :asc)
```

Using SQL in `.where`
------------

Less then and greater than operators
```rb
Post.where("publish_at >= ?", Time.now)

Post.where("publish_at < ? AND visible = ?", Time.now, true)
```

Fuzzy string search

```rb
Post.where("content LIKE ?", "%Active Record%")
# % means wildcard, any characters can come here

Post.where("content ILIKE ?", "%active record%")
# ILIKE is case-insensitive

Post.where("title ILIKE ?", "%scalable%")
```

Using an OR operator (`.where` uses AND)

```rb
Post.where("visible = ? OR user_id < ?", false, 3)
```

Has many associations
----------

Return all instances of posts for a given user

```rb
u = User.first
u.posts
```

Combine queries on associations

```rb
u = User.first
u.posts.find(1) # find a single instance by id but ensure it belongs to this user

u.posts.where(visible: true).order(publish_at: :desc)
```
Examples
--------

Find all blog posts that have been published:

```rb
# if publish_at is less than now, that means it's in the past
Post.where("publish_at <= ?", Time.now)
```

Find all public posts from a given user

```rb
u = User.first

u.posts.where(private: false)
```

Find all users who have an email address with the domain `wells.com`

```rb
User.where("email ILIKE ?", "%wells.com")
```
Find the 5 most recently published blog posts

```rb
Post.where("publish_at <= ?", Time.now).order(publish_at: :desc).limit(5)
```

Find all public posts which contain the word `"organic"` in the title

```rb
Post.where(private: false).where("title ILIKE ?", "%organic%")
```

Find the last post which contains the word "protocol" which was published before yesterday

```rb
Post.where("content ILIKE ? AND publish_at < ?", "%protocol%", 1.day.ago).last
```

Search all posts of the last user for any search term

```rb
search_term = "matrix"

User.last.posts.where("content ILIKE ?", "%#{search_term}%")
```

Queries across tables
-------------------

Find all users who have public posts

```rb
User.includes(:posts).where(posts: {private: false}).references(:posts)
```

Find all posts which have a user with the word `"well"` in their username

```rb
Post.includes(:user).where("users.username ILIKE ?", "%well%").references(:users)
```
Other random things
------------------

Finding by multiple values on a single column:

```rb
User.where(id: [1,2,3])
```

Checking if an instance exists by a query

```rb
Post.where("publish_at < ?", 30.days.ago).exists?
```
