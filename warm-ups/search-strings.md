# Search Strings

Create a class which is able to do a O(1) search on a list of strings. Typically when searching through a group of strings at best we would get O(n), but we can pre-parse the strings to create a Hash to keep track of the words in each string. For example if we had the string `"The quick brown fox"`, would could pre-parse this down to a hash that looks like: 

```rb
words = {
  "The"   => "The quick brown fox", 
  "quick" => "The quick brown fox", 
  "brown" => "The quick brown fox", 
  "fox"   => "The quick brown fox"
}
```

Then on that hash, we can 'search' for the word `'fox'` with `words["fox"]`, this would be an O(1) search because it doesn't actually need to search by comparing words, it just looks for the index then returns the sentence, while `words["pineapple"]`, would return `nil`. 

The above example is on a single string, but we want our class to search an array of strings, and the search method should return an array of matches:

```rb
sentences = ["I'm a cat", "I'm a dog", "Fuzzy wuzzy was a bear", "The quick brown fox"]

s = Search.new(sentences)

s.search("wuzzy") # => ["Fuzzy wuzzy was a bear"]
s.search("I'm") # => ["I'm a cat", "I'm a dog"]
```
