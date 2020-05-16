
class CashRegister

  attr_accessor :total, :discount

  def initialize(discount=0)
    @total = 0
    @discount = discount.to_f
    @items = []
  end

  def add_item(item, price, quantity=1)
    @cart = []
    @recent_price = price.to_f * quantity
    @total += @recent_price
    quantity.times {@items << item}
    @cart << [item, @recent_price, quantity]
    @last_transaction = @cart[-1]
  end



  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
    @total -= @total * (@discount / 100)
     return "After the discount, the total comes to $#{@total.to_i}."
   end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @cart[-1][1]
    @cart[-1][2].times { @items.pop }
    @cart.pop
    if @items.empty?
      @total = 0.0
    end

  end


end
