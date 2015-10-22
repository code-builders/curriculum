# Inheritance

Make a class called `Music` with the following attributes:

- `title`
- `artist`
- `price`

And the following methods:

- `needs_to_be_shipped?` - Returns a boolean of whether this format of music needs to be shipped to a customer, defaults to `true`
- `downloadable?` - Returns a boolean of whether this type of music is in a downloadable format, defaults to `false`

Create the following classes, each in their own file:

- Create another class called `Cd` which inherits from `Music`, overwrite the two methods above to make sense for a cd format
- Create another class called `Mp3` which inherits from `Music`, overwrite the two methods above to make sense for a mp3 format
- Create another class called `Sample` which inherits from `Mp3`, overwrite the two methods above to make sense for a mp3 sample format, also overwrite the `price` method to always return 0

In `irb` load all of these classes and create at least one of each type, give them their attributes and call each method on them.
