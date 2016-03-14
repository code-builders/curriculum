# Organizing javascript

In this lecture we are going to write out the same logic in several approaches and talk about the difference along the way.

```js
var basePrice = 1.00;
var weight = 1.2;
var volume = 3000;

var priceForWeight = function() {
  return (weight * volume) / 1000
}

var shippingPrice = function() {
  return basePrice + priceForWeight();
}
```
- Advantages:
  - Easy to write and understand
- Disadvantages:
  - Everything is a global variable
  - Variables are easily overwritten by accident
  - All variables can be changed maliciously
  - Leads to unorganized "spaghetti" code

## Object Literal Pattern

```js
var calculator = {
  volume: 3000,
  basePrice: 1.00,
  weight: 1.2,
  priceForWeight: function() {
    return (this.weight * this.volume) / 1000;
  },
  shippingPrice: function() {
    return this.basePrice + this.priceForWeight();
  }
}
```
Advantages:
  - Only one global variable `calculator`
  - All variables are encapsulated
Disadvantages:
  - All attributes can be accessed (i.e. someone could change `basePrice` easily)
  - Inflexible Object syntax, spacing and organization are harder

## Module Pattern

```js
calculator = function() {
  var basePrice = 1.00;
  return {
    weight: 1.2,
    volume: 3000,
    priceForWeight: function() {
      return (this.weight * this.volume) / 1000;
    },
    shippingPrice: function() {
      return basePrice + this.priceForWeight();
    }
  }
}();
```

Advantages:
  - Only one global variable
  - Can make private attributes (i.e. `basePrice`)
Disadvantages:
  - Inflexible Object syntax, spacing and organization are harder
  - Have to switch between using `this` and variables

```js
calculator = function() {
  var basePrice = 1.00;
  var weight    = 1.2;
  var volume    =  3000;

  var priceForWeight = function() {
    return (this.weight * this.volume) / 1000;
  };

  var shippingPrice = function() {
    return basePrice + priceForWeight();
  };
  return {
    weight: weight,
    volume: volume,
    shippingPrice: shippingPrice
  }
}();
```

Advantages:
  - Only one global variable
  - Can make private attributes (i.e. `basePrice`)
  - Easier organization and grouping of code
  - No switching between `this` and variables
Disadvantages:
  - Have to define getters and setters for variables which are used within private functions

```js
(function(exports) {
  var basePrice  = 1.00;
  exports.weight = 1.2;
  exports.volume =  3000;

  exports.priceForWeight = function() {
    return (exports.weight * exports.volume) / 1000;
  };

  exports.shippingPrice = function() {
    return basePrice + exports.priceForWeight();
  };
  return exports;
}(calculator = {}));
```
Advantages:
  - Only one global variable
  - Can make private attributes (i.e. `basePrice`)
  - Easier organization and grouping of code
  - Private functions can refer to variables
Disadvantages:
  - Have to switch between `exports` and variables

## Prototype Pattern

```js
var Calculator = function () {
  var basePrice = 1.00;
  this.weight = 1.2;
  this.volume = 3000;
}

Calculator.prototype.priceForWeight = function() {
  return (this.weight * this.volume) / 1000;
};

Calculator.prototype.shippingPrice = function() {
  return basePrice + this.priceForWeight();
};
```

Advantages:
  - Only one global variable
  - Can make private attributes (i.e. `basePrice`)
  - Easier organization and grouping of code
  - Private functions can refer to variables
  - Object oriented approach including inheritance
Disadvantages:
  - Have to switch between `this` and variables

```js
var Calculator = function () {
  this.weight = 1.2;
  this.volume = 3000;
}

Calculator.prototype = function() {
  var basePrice = 1.2;

  var priceForWeight = function() {
    return (this.weight * this.volume) / 1000;
  };

  var shippingPrice = function() {
    return basePrice + priceForWeight();
  };

  return {priceForWeight: priceForWeight, shippingPrice: shippingPrice};
}();
```
