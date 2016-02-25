class ShippingCalculator:

    def __init__(self, weight, width=1, length=1, height=1):
        self.weight = weight
        self.width  = width
        self.length = length
        self.height = height

    def volume(self):
        return self.width * self.height * self.length

    def base_price(self):
        if   self.weight <= 1: return 99
        elif self.weight <= 2: return 199
        else:                  return 699

    def multiplier(self):
        if   self.volume() <= 500:  return 1
        elif self.volume() <= 1000: return 1.5
        else:                       return 4

    def price(self):
        return self.base_price() * self.multiplier()

calc = ShippingCalculator(1, length=10)
print(calc.price())
