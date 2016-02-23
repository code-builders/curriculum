class Palindrome:

    def __init__(self, word):
        self.word = word

    def is_palindrome(self):
      middle = len(self.word) / 2
      counter = 0
      while counter < middle:
        if self.word[counter] != self.word[-1 - counter]: return False
        counter += 1
      return True
      ------------
      return self.word.lower() == self.word.lower()[::-1]


print(Palindrome("racecar").is_palindrome())
print(Palindrome("ARacecar").is_palindrome())
