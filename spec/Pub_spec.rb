require('minitest/autorun')
require('minitest/rg')
require_relative('../Pub')
require_relative('../Drink')

class TestPub < MiniTest::Test
  def setup
    beer = Drink.new('Beer', 3)
    wine = Drink.new('Wine', 4)
    rum = Drink.new('Rum', 6)
    drinks = [beer, wine, rum]
    
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
end