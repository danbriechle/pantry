require './lib/pantry'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test
  #
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

  def test_shoping_list_can_be_added_to
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)
    pantry.add_to_shopping_list(r)
    expected = {"Cheese" => 20, "Flour" => 20}
    assert_equal expected, pantry.shopping_list
  end

  def test_other_ingredients_can_be_added
    pantry = Pantry.new
    recipe = Recipe.new("Cheese Pizza")
    recipe.add_ingredient("Cheese", 20)
    recipe.add_ingredient("Flour", 20)
    pantry.add_to_shopping_list(recipe)
    recipe_2 = Recipe.new("Spaghetti")
    recipe_2.add_ingredient("Spaghetti Noodles", 10)
    recipe_2.add_ingredient("Marinara Sauce", 10)
    recipe_2.add_ingredient("Cheese", 5)
    pantry.add_to_shopping_list(recipe_2)
    expected = {"Cheese" => 25, "Flour"=>20, "Spaghetti Noodles" => 10, "Marinara Sauce" => 10}
    assert_equal expected, pantry.shopping_list
  end

  def test_shopping_list_can_be_printed
    pantry = Pantry.new
    recipe = Recipe.new("Cheese Pizza")
    recipe.add_ingredient("Cheese", 20)
    recipe.add_ingredient("Flour", 20)
    pantry.add_to_shopping_list(recipe)
    recipe_2 = Recipe.new("Spaghetti")
    recipe_2.add_ingredient("Spaghetti Noodles", 10)
    recipe_2.add_ingredient("Marinara Sauce", 10)
    recipe_2.add_ingredient("Cheese", 5)
    pantry.add_to_shopping_list(recipe_2)
    expected = "* Cheese: 25\n* Flour: 20\n* Spaghetti Noodles: 10\n* Marinara Sauce: 10"
    assert_equal expected, pantry.print_shopping_list
  end


end
