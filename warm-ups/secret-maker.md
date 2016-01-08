# Secret Maker

Create a class and method which takes a string argument, which then creates a new string that looks like gibberish. Given the same string argument twice, the same gibberish should be given back.

You will have to come up with a clever way to disguise the letters so they are not easily deciphered.

An easy one would be to use the next letter in the alphabet:

```rb
SecretMaker.new("Hello there").secret # => "Ifmmp!uifsf"
```

But that one is pretty easy to decipher. Go for something more complex. 

```rb
SecretMaker.new("Hello there").secret # => "auha89hakd"
SecretMaker.new("Hello there").secret # => "auha89hakd"
# Yours should return something different than mine.

SecretMaker.new("Bye bye").secret # => "0h24i8dhoi"
```
