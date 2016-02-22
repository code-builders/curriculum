class Anagram:

    def __init__(self, word, other_word):
        self.word       = word
        self.other_word = other_word


    def is_anagram(self):
        sorted_word       = sorted(self.word)
        sorted_other_word = sorted(self.other_word)
        return sorted_word == sorted_other_word

print(Anagram("dog", "god").is_anagram())
print(Anagram("fish", "god").is_anagram())
