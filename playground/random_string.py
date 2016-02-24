import random
class RandomString:

    @classmethod
    def generate(self, n):
        chars = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

        result = [None] * n
        for i,v in enumerate(result):
            rand_char = random.sample(chars, 1)
            result[i] = str(rand_char[0])
        return ''.join(result)


print(RandomString.generate(100))
