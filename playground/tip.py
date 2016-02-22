class Tip:
    tip_map = {
                "great":    .25,
                "good":     .2,
                "average":  .15,
                "bad":      .1,
                "terrible": .05
              }

    def __init__(self,check):
        self.check = check


    def tip_amount(self, service_rating):
        return self.check * Tip.tip_map[service_rating]

t = Tip(45.88)
print(t.tip_amount("great"))
print(t.tip_amount("average"))
print(t.tip_amount("bad"))
print(t.tip_amount("terrible"))
