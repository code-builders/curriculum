Create an `Elevator` class which has one attribute (`floor`) which should default to `1`.

- Create a method called `move(f)`, the argument `f` is the floor it should move to (reassign the `floor` attribute).
- Create a method called `goUp(from, to)`, the argument `from` is the floor that the "user" is calling it from, and `to` is the floor they want to go to. `to` must be greater than `from`, if not it should return nil and not change the floor. Reuse the `move` method to accomplish this.
- Create a method called `goDown(from, to)`, same as `goUp` but `to` must be less than `from`.


```rb
e = Elevator.new
e.goUp(2,6)
e.floor # => 6
```

## Phase Two

Make the elevator have three shafts, so instead of `floor` have `shaft_a`, `shaft_b`, and `shaft_c` which all represent floors, `a` defaults to `1`, `b` defaults to `50` and `c` defaults to `100`

- When using the `goUp` or `goDown` methods always choose the shaft which is closest to the `from` floor.
