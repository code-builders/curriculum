## Dice JS

Create a `dice` object with the following:

1. An attribute called `values` default as an `Array`.
1. A function called `roll`
  - The function takes one argument, an `Integer`, which represents the number of dice to roll
  - For the number of dice to roll, add a random number (1-6) into the `values` array
  - The method returns the `values` array for the user to see what the result of the dice rolling was.
  - Each new roll of the same dice object should clear the `values` array to only return the values of each specific roll.

Here is an example of the expected usage:

```rb
dice = // create dice object here
dice.roll(2)
 # => [5,2] (each of the numbers should be random and different each roll)
dice.roll(4)
 # => [1,4,5,5]
dice.roll()
 # => [3]
```


### Extended Requirements

- Add a `sides` value to optionally be set in initialize, this will change it from a six sided die to an n sided die
- Create a `PigGame` class and implement the rules of [Pig](https://en.wikipedia.org/wiki/Pig_(dice_game)) using the Dice class.
- Create a `Player` class to keep track of the players and their scores in `PigGame`.
