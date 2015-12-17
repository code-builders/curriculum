# Vote

Create a `vote` object. The `vote` object should have a question attribute and a results attribute.

The `question` attribute should be a string that is passed in as an argument when the object is created.

The `result` attribute should be another object with keys of the given answers and value of the number of votes that key has received

```js
vote = // create object here
vote.cast("Hillary")
vote.cast("Ada")
vote.cast("Ada")
vote.results # => {Hillary: => 1, Ada: => 2}
```

Silver
------

Create the following functions for `vote`:

- `winner` Returns a string of the top entry
- `vote_count` Returns the number of total votes

Gold
-----

Create a `stats` function that prints the current status

```ruby
vote.stats

# 3 Votes total
# Ada (1 vote)
# Hillary (2 votes)
#
# Ada is currently in the lead
```
