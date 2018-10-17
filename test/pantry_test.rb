require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test

  def test_it_exists
    pantry = Pantry.new
    assert_instance_of Pantry, pantry
  end

def test_it_has_a_stock
  pantry = Pantry.new
  assert_instance_of Hash, pantry.stock
end

def test_stock_has_default_value
  pantry = Pantry.new
  assert_equal 0, pantry.stock_check("Cheese")
end

def test_it_can_be_restocked
  pantry = Pantry.new
  pantry.restock("Cheese", 10)
  assert_equal 10, pantry.stock_check("Cheese")
end

def test_stock_can_be_added_to
  pantry = Pantry.new
  pantry.restock("Cheese", 10)
  pantry.restock("Cheese", 20)
  assert_equal 30, pantry.stock_check("Cheese")
end
end
