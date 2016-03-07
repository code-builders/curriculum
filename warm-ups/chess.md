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

Day 2
-------

Make a `Chess::Pawn` class with the following:

- `initialize(side)` - `new` takes one arguement which should be either `:dark` or `:light` as symbols.
- `side` - attribute assigned from initialize
- `starting_position?` attributes default to true
- `can_move_to?(square)` a method which takes one argument, this method determines if the pawn can move to that square, here is the logic for moving:
  - cannot move backwards
  - if `starting_position?` is `false`
    - can move +1 forward to a empty square
    - diagonally +1 to an occupied square
  - if `starting_position?` is `true`
    - can move +2 forward to a empty square in addition to when `starting_position?` is `false`
- `moved_to(square)` - called after a pawn as been moved - changes `starting_position?` to `false`

There will be more to add to the `Pawn` class, and there may be some gaps in our logic until we pull all of the components together.

Day 3
-----

Create a `Chess::Square` class, instances of this class will replace the `nil` values in our board matrix. It will have the following:

- `#occupant` - defaults to `nil`, but can be initialized with a value (like a `Chess::Pawn`)
- `#row` - initialized as the row for this square `a-h`
- `#column` - initialized as the column for this square `1-8`


Modify the `Chess::Board` to initialize squares instead of nil with the correct `row` and `column`

```rb
Chess::Square("a", 7, nil) # => <Chess::Piece#123 occupant=nil row="a" column=7>
```

Day 4
-----

Tie the existing components together:

- Make `Pawn#can_move_to?(square)` take a `Chess::Square` as an argument rather than a string.
- Make the `Chess::Board` initialize with two rows of `Chess::Pawn` instances on rows 2 & 7.
- Make the `Chess::Square` instances on the board have the correct row and column when initialized on the board
