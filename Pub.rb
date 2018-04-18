class Pub

  attr_reader :name, :till, :drinks

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
  end

  def sell_a_drink(drink, age)
    return false if age < 18
    @till += drink.price

    return true
  end


end