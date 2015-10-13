# name
# price (cents)
# qty_in_stock

class Product

  def initialize(n,p,q)
    @name = n
    @price = p
    @qty_in_stock = q
  end

  def name
    @name
  end

  def price
    @price
  end

  def formatted_price
    @price.to_f / 100
  end

  def qty_in_stock
    @qty_in_stock
  end

  def in_stock?
    @qty_in_stock > 0
  end

  def buy!
    if in_stock?
      @qty_in_stock -= 1
    else
      puts "This product is out of stock"
      false
    end
  end

end


# --------------------------

p = Product.new("Cool Gloves", 4999, 100)
puts p.name
puts p.price
puts p.qty_in_stock
