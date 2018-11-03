require './lib/recipe'
require 'pry'

class Pantry

attr_reader :stock, :shopping_list, :cook_book
  def initialize
    @stock = Hash.new(0)
    @shopping_list = Hash.new(0)
    @cook_book = Hash.new(0)

  end


  def stock_check(item)
    @stock[item]
  end

  def restock(food, quantity)
    @stock[food] += quantity
  end

  def add_to_shopping_list(recipe)
    ingredients = recipe.ingredients.keys
    ingredients.each do |name|
      @shopping_list[name] += recipe.ingredients[name]

    end
  end

  def print_shopping_list
    printed = @shopping_list.map do|k,v|
       "* #{k.to_sym}: #{v}\n"
     end
     printed.join.chomp
  end

  def add_to_cookbook(recipe)
    @cook_book[recipe.name] = recipe.ingredients
  end

  def can_i_make(ingredients)
    ingredients.all? do |ingredient, amount|
      stock_check(ingredient) > amount
    end
  end

  def what_can_i_make
    what = []
      @cook_book.each do |name, ingredients|
      if can_i_make(ingredients)
        what << name
      end
      end
    what
  end

  def how_many(recipe)
    @cook_book[recipe].map do |ingredient, amount|
      @stock[ingredient] / amount
    end.min
  end

  def how_many_can_i_make
    many = {}
    @cook_book.each do |recipe, ingredients|
      if how_many(recipe) > 1
        many[recipe] = how_many(recipe)
      end
    end
    many
  end


end
