require('minitest/autorun')
require('minitest/rg')
require_relative('../Customer')
require_relative('../Drink')
require_relative('../Pub')

class TestCustomer < MiniTest::Test
  def setup
    @customer = Customer.new('Annie', 100, 35)
    @customer2 = Customer.new('John', 10, 16)

    @beer = Drink.new('Beer', 3, 1)
    @wine = Drink.new('Wine', 4, 2)
    @rum = Drink.new('Rum', 6, 4)
    drinks = [@beer, @wine, @rum]
    
    @pub = Pub.new("The Bear arms", 0, drinks)
  end

  def test_customer_has_name
    assert_equal('Annie', @customer.name)
  end

  def test_customer_has_wallet
    assert_equal(100, @customer.wallet)
  end

  def test_customer_has_age
    assert_equal(35, @customer.age)
  end

  def test_customer_can_buy_rum_from_pub__above_legal_age
    @customer.buy_a_drink(@pub, @rum)
    assert_equal(94, @customer.wallet)
    assert_equal(6, @pub.till)
  end

  def test_customer_can_buy_rum_from_pub__not_above_legal_age
    @customer2.buy_a_drink(@pub, @rum)
    assert_equal(10, @customer2.wallet)
    assert_equal(0, @pub.till)
    assert_equal(0, @customer2.drunkenness)
  end
  
  def test_customer_has_drunkenness_level
    assert_equal(0, @customer.drunkenness)
  end

  def test_customer_gets_drunker
    @customer.buy_a_drink(@pub, @wine)
    assert_equal(2, @customer.drunkenness)
  end

end