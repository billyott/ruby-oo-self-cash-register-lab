require 'pry'

class CashRegister

    attr_accessor :total, :discount, :items, :last_item_price

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title,price,quantity=1)
        @total += price * quantity
        quantity.times {@items << title}
        @last_item_price = price * quantity 
    end

    def apply_discount
        if discount != 0
            @total = @total*(1-@discount.to_f/100.0)
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total -= @last_item_price
    end

end

# test = CashRegister.new(20)
# test.add_item("milk",100)
# binding.pry