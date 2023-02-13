

class CashRegister
  attr_accessor :total, :discount, :items
  def initialize(discount = nil)
      @discount = discount
      @total = 0    
      @items = []
  end

  def add_item(title, price, quantity = 1)
      @price = price
      @quantity = quantity
      self.total += (@price * @quantity)
      @quantity.times{@items << title}
  end

  def apply_discount
      if self.discount
          discount = @discount/100.0 * self.total
          self.total -= discount
          "After the discount, the total comes to $#{self.total.round}."
      else
          self.total
          'There is no discount to apply.'
      end
  end

  def void_last_transaction
      self.total -= (@price * @quantity)        
  end
  
end