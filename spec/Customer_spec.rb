require('minitest/autorun')
require('minitest/rg')
require_relative('../Customer')

class TestCustomer < MiniTest::Test
  def setup
    @customer = Customer.new('Annie', 100)
  end

  def test_customer_has_name
    assert_equal('Annie', @customer.name)
  end

  def test_customer_has_wallet
    assert_equal(100, @customer.wallet)
  end
  
end