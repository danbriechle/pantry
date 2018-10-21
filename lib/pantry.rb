require './lib/recipe'
require 'pry'

class Pantry

attr_reader :stock
attr_accessor :shopping_list
  def initialize
    @stock = Hash.new(0)
    @shopping_list = Hash.new(0)

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

end
