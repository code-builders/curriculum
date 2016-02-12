# Scrabble

Create a `Scrabble` module with a `Word` class nested within.

```rb
module Scrabble
  class Word
  end
end
```

Make initialize of the `Scrabble::Word` class take a string argument (the word), add the following methods to the class:

- `self.scoring_table` a class method which returns a hash, each key value is a letter and it's score in scrabble:

|Letter                        | Value|
|:----------------------------:|:----:|
|A, E, I, O, U, L, N, R, S, T  |   1  |
|D, G                          |   2  |
|B, C, M, P                    |   3  |
|F, H, V, W, Y                 |   4  |
|K                             |   5  |
|J, X                          |   8  |
|Q, Z                          |   10 |

- `#score` - returns the score of the word by character

```rb
Scrabble::Word.scoring_table # => {a: 1, b: 2, c: 3, d: 2, e: 1, etc...}

word = Scrabble::Word.new("Daneel")
word.score # => 7
```
