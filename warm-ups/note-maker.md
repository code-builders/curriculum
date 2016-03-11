# Note Maker

Make a class which attempts to make a (ransom) note out of letters taken from a magazine. Of course the magazine isn't real, it's just a string. The class should take two strings, one is the "magazine" one is the note that you want to make. Each time a letter is needed for the note you want to make it has to be removed from the magazine, if a letter doesn't exist in the magazine a space should be used. Return the final note from a method called `note`:

```rb
NoteMaker.new("I have your Dog", "Dog has your icecream").note # => "I ha e your Dog"
``
