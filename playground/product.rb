class Product
  attr_accessor :name,
                :description,
                :price_in_cents,
                :quantity_in_stock

  def initialize(n,d,p,q)
    @name              = n
    @description       = d
    @price_in_cents    = p
    @quantity_in_stock = q
  end

  def formatted_price
    "$#{sprintf('%.2f', price)}"
  end

  def price
    price_in_cents.to_f/100
  end

  def buy!(n)
    if n > quantity_in_stock
      raise "You can't buy that many"
    end

    @quantity_in_stock -= n
  end
end
