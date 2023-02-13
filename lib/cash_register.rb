class CashRegister
  attr_accessor :total
  attr_reader :discount, :item_history

  def initialize(discount = nil)
    @total = 0.0
    @discount = discount
    @item_history = []
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    quantity.times { @item_history << title }
  end

  def apply_discount
    if @discount > 0
      @total -= (@total * (@discount.to_f / 100))
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @item_history
  end

  def void_last_transaction
    @total -= @item_history.pop[1]
  end
end