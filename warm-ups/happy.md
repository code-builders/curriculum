Create a `Sentiment` class which analyzes text to determine if the text is "happy" or not. Use any means to analyze the text for common patterns.

```rb
s = Sentiment.new("I am happy!")
s.happy? true

s = Sentiment.new("I am sad!")
s.happy? false

s = Sentiment.new("I am not happy!")
s.happy? false
```

Use the following examples:

```
"I am happy!" # => true
"I am sad!" # => false
"I am excited!" # => true
"I am not happy!" # => false
"I'm so happy that you're happy" # => true
"I like turtles" # => false
"Why should I be happy" # => false
```

<small>start with the first, get it to work, then build up the logic as you go</small>
