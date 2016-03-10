# Guessing Game

Create a `GuessingGame` class, a new instance picks a random number which it stores in an instance variable. Then allows the user to guess by using the `#guess(n)` method

- `#random` - attribute, a random number between 1-100, created on initialize.
- `#guess(n)` - submits a guess to the instance, this compares `n` with the random number, returns one of the following messages:
  - "Nope, the number is below n"
  - "Nope, the number is above n"
  - "Yep, the number is n"
- `#inspect` - override the `inspect` method to return a string of your choosing, this will override the object returned in the console (because, it would show the random number, and that would be cheating)
