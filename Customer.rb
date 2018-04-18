class Customer
  attr_reader(:name, :wallet, :age)

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
  end

  def buy_a_drink(bar, beverage)
    drink_sold = bar.sell_a_drink(beverage, @age)
    @wallet -= beverage.price if drink_sold
  end
end