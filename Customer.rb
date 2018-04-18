class Customer
  attr_reader(:name, :wallet, :age, :drunkenness)

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunkenness = 0
  end

  def buy_a_drink(bar, beverage)
    drink_sold = bar.sell_a_drink(beverage, @age)
    if drink_sold
      @wallet -= beverage.price
      @drunkenness += beverage.alcohol_level
    end
  end
end