class View
  def ask_for_name_and_description
    attributes = {}
    puts "What is the name of your recipe?"
    attributes[:name] = gets.chomp
    puts "What is the description of your recipe?"
    attributes[:description] = gets.chomp
    attributes
  end

  def list_the_recipes(recipes)
    recipes.each do |recipe|
      puts "#{recipe.name} : #{recipe.description}"
    end
  end

  def ask_which_recipe_to_remove(recipes)
    # we will show the user the current list of recipe
    recipes.each_with_index do |recipe, index|
      puts "#{index}: #{recipe.name} : #{recipe.description}"
    end
    # ask the user which one they want to remove
    puts "Which recipe do you want to remove (give the number)"
    recipe_id = gets.chomp.to_i
  end
end
