require('minitest/autorun')
require('minitest/rg')
require_relative('../Pub')

class TestPub < MiniTest::Test
  def setup
    @pub = Pub.new("The Bear arms", 0)
  end

  def test_pub_has_name
    assert_equal('The Bear arms', @pub.name)
  end

  def test_pub_has_empty_till
    assert_equal(0, @pub.till)
  end

  def test_pub_has_no_drinks
    assert_equal([], @pub.drinks)
  end
end