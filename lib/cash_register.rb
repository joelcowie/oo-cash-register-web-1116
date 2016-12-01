require "pry"

class CashRegister

  attr_accessor :discount, :total, :items

def initialize(discount = 0)
  @total = 0
  @discount = discount
  @items = []
end

def add_item(item, price, quantity = 1)
  @last_price = price * quantity
  @total = @total + (price * quantity)
  quantity.times do @items << item
  end
end

def apply_discount
  if self.discount > 0
    self.total = ( self.total * (100 - self.discount) / 100 )
    return "After the discount, the total comes to $#{@total}."
  elsif self.discount == 0
    self.total
    return "There is no discount to apply."
  end
end

def items
  @items
end

def void_last_transaction
  @total = @total - @last_price
end

end
