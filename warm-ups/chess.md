# Chess

Create a Command Line Chess game.

Day 1
-------

Make a `Chess::Board` class, an instance of this class should have the following:

- `squares` attribute - an array of arrays (8x8 matrix), default each item in the inner arrays to `nil`.
- `square(x, y)` returns the value at the row `x` in the columns `y` of that row. `x` will be a string a-h (which represents 1-8), and y should be 1-8. See the [rules of chess](http://www.chessvariants.com/d.chess/chess.html)

```rb
board = Chess::Board.new
board.square("a", 7) # => nil (for now everything will be nil)
```
