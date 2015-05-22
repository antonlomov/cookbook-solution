require_relative 'recipe'
require_relative 'view'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    # ask our cookbook for all the recipes
    recipes = @cookbook.recipes
    # give the recipes to our view
    @view.list_the_recipes(recipes)
  end

  def create
    # ask user for input about the recipe
    attributes = @view.ask_for_name_and_description
    # create a new instance with the input from user
    new_recipe = Recipe.new(attributes)
    # store the instance in the database
    @cookbook.add_recipe(new_recipe)
  end

  def destroy
    # destroy an existing recipe
    # ask the user which recipe to remove
    recipes = @cookbook.recipes
    recipe_id = @view.ask_which_recipe_to_remove(recipes)
    # with the index we are going to tell cookbook to remove it
    @cookbook.remove_recipe(recipe_id)
  end
end
