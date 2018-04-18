class Customer
  attr_reader(:name, :wallet, :age)

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
  end

  def buy_a_drink(bar, beverage)
    @wallet -= beverage.price
    bar.sell_a_drink(beverage)  
  end
end