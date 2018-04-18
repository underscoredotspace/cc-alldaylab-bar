require('minitest/autorun')
require('minitest/rg')
require_relative('../Pub')
require_relative('../Drink')
require_relative('../Customer')

class TestPub < MiniTest::Test
  def setup
    @customer1 = Customer.new('Annie', 100, 35)
    @customer2 = Customer.new('John', 10, 16)

    @beer = Drink.new('Beer', 3)
    @wine = Drink.new('Wine', 4)
    @rum = Drink.new('Rum', 6)
    drinks = [@beer, @wine, @rum]
    
    @pub = Pub.new("The Bear arms", 0, drinks)
  end

  def test_pub_has_name
    assert_equal('The Bear arms', @pub.name)
  end

  def test_pub_has_empty_till
    assert_equal(0, @pub.till)
  end

  def test_pub_has_three_drinks
    assert_equal(3, @pub.drinks.count())
  end

  def test_pub_can_sell_drink
    sold = @pub.sell_a_drink(@wine, @customer1.age)
    assert_equal(true, sold)
    assert_equal(4, @pub.till)
  end

  def test_pub_refuses_to_sell_drink
    sold = @pub.sell_a_drink(@wine, @customer2.age)
    assert_equal(false, sold)
    assert_equal(0, @pub.till)
  end


end