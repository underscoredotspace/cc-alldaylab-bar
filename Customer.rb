class Customer
  attr_reader(:name, :wallet)

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def buy_a_drink(bar, beverage)
    @wallet -= beverage.price
    bar.sell_a_drink(beverage)  
  end
end