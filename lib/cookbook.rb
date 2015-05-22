require 'CSV'

class Cookbook
  attr_reader :recipes

  def initialize(csv_file)
    @recipes = []
    @csv_file = csv_file
    open_and_load_csv_file
  end

  def add_recipe(recipe)
    # add the recipe to the list of recipes
    @recipes << recipe
    # save the recipe in the csv file
    # so we don't lose it afterwards
    save_to_csv
  end

  def remove_recipe(recipe_id)
    # remove the recipe from the array with recipes
    @recipes.delete_at(recipe_id)
    # rewrite our csv file with the new array of recipes
    save_to_csv
  end

  private
  def open_and_load_csv_file
    return unless File.exist?(@csv_file)

    CSV.foreach(@csv_file) do |row|
      attributes = {
        name: row[0],
        description: row[1]
      }
      @recipes << Recipe.new(attributes)
    end
  end

  def save_to_csv
    CSV.open(@csv_file, 'w') do |csv|
      @recipes.each do |recipe|
        csv.puts([recipe.name, recipe.description])
      end
    end
  end

end
