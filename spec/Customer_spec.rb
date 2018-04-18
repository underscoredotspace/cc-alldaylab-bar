require('minitest/autorun')
require('minitest/rg')
require_relative('../Customer')
require_relative('../Drink')
require_relative('../Pub')

class TestCustomer < MiniTest::Test
  def setup
    @customer = Customer.new('Annie', 100, 35)

    @beer = Drink.new('Beer', 3)
    @wine = Drink.new('Wine', 4)
    @rum = Drink.new('Rum', 6)
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

  def test_customer_can_buy_rum_from_pub
    @customer.buy_a_drink(@pub, @rum)
    assert_equal(94, @customer.wallet)
    assert_equal(6, @pub.till)
  end
  
end