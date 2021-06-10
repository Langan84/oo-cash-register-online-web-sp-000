class CashRegister
  #@@all = []
attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = 0.0)
    self.total = 0
    self.discount = discount.to_f
    self.items = []
    self.last_transaction = 0
  end

  def add_item(title, price, quantity = 1)
    quantity.times do
      self.items << title
    end
    self.last_transaction = price * quantity
    self.total += last_transaction
  end

  def apply_discount
    if discount != 0
      self.total = (total * ((100.0.to_f - discount)/100)).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
 end

  def void_last_transaction
    self.total = self.total - self.last_transaction
  end

end
