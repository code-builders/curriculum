# Shipping calculator

Create a `ShippingCalculator` class which determines the cost of shipping based on weight and size of a shipment. It should initialize with a `weight`, `width`, `length`, and `height` Rules:

- 0-1 lbs - 0.99
- 1-2 lbs - 3.99
- 2-5 lbs - 7.99
- 5-10 lbs - 12.99
- 10+ lbs - 18.99

Then use the volume (width * height * length) to add a multiplier:

- 100 cubic/inches - 0
- 100-500 cubic/inches - * 1.2
- 500-1000 cubic/inches - * 1.5
- 1000-2000 cubic/inches - * 2
- 2000-4000 cubic/inches - * 3
- 4000-10000 cubic/inches - * 4
- 10000+ cubic/inches - * 6

```rb
sc = ShippingCalculator.new(3, {width: 12, length: 12, height: 4})
sc.price # => 1199
```
