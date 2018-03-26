require_relative '../config/environment'
require_relative '../app/models/fridge'
def run_tracker
  puts <<~HEREDOC
         Welcome to the fridge Tracker
         What Would you like to do?
         1. See all of your fridges
         2. Add a Fridge
         3. Delete a Fridge
         Select a number:
       HEREDOC
  user_descision = gets.chomp.to_i

  if user_descision == 1
    puts pp Fridge.all
    puts "Enter ID of fridge you would like to see."
    fridge_id = gets.chomp.to_i
    puts checkout_fridge(fridge_id)
  elsif user_descision == 2
    puts "What is the brand?"
    brand = gets.chomp
    puts "Location?"
    location = gets.chomp
    puts "Size?"
    size = gets.chomp.to_i
    puts "Has food?"
    has_food = gets.chomp
    puts "Has drink?"
    has_drinks = gets.chomp
    new_fridge = Fridge.create(brand: brand, location: location, size: size, has_food_in_it: has_food, has_drinks_in_it: has_drinks)
    puts pp new_fridge
  elsif user_descision == 3
    puts "Enter fridge ID to delete"
    fridge_id = gets.chomp.to_i
    Fridge.find(fridge_id).destroy
    puts "Successfully deleted!"
  else puts "Enter a correct damn number!"
  end

end
def checkout_fridge(fridge_id)
  id = fridge_id
  
  # Find and Print a Fridge
  puts <<~HEREDOC
         What would you like to do with the fridge?
         1. Checkout the Food
         2. Checkout the Drinks
         3. Return to fridge Menu
         select a number:
       HEREDOC
  user_descision = gets.chomp.to_i
  if user_descision == 1
    puts "What would you like to do with food?"
    puts run_food_menu(id)
elsif user_descision == 2
  puts "What would you like to do with drinks?"
  puts run_drink_menu(id)
elsif user_descision == 3 
  puts pp Fridge.all
  puts "Enter ID of fridge you would like to see."
  fridge_id = gets.chomp.to_i
  puts checkout_fridge(fridge_id)
else puts "Enter a correct number, god damn it!"
end
end
def run_food_menu(fridge)
  fridge = fridge
  puts <<~HEREDOC
         1. View All Food Items in a specific Firdge
         2. Add a food item to a fridge
         3. Eat a food item from a fridge
         4. Go Back to Fridge Menu
         Select a number:
       HEREDOC
  user_descision = gets.chomp.to_i
  if user_descision == 1
    puts pp Fridge.find(fridge).foods.all
  elsif user_descision == 2
    puts "What is the item?"
    name = gets.chomp
    puts "Weight?"
    weight = gets.chomp.to_i
    puts "Is it vegan? True or false?"
    vegan = gets.chomp
    puts "Date?"
    date = gets.chomp
    new_item = Fridge.find(fridge).foods.create(name: name, weight: weight, is_vegan: vegan, time_put_in_fridge: date)
    puts pp new_item
  elsif user_descision == 3
    puts pp Fridge.find(fridge).foods.all
    puts "Enter ID of item you want to eat."
    eat_food = gets.chomp.to_i
    Fridge.find(fridge).foods.find(eat_food).destroy
  else puts "Enter a real number!"
  end
end
def run_drink_menu(fridge)
  fridge = fridge
  puts <<~HEREDOC
         1. View all drink items in a specific fridge
         2. Add a drink item to a fridge
         3. Consume PART of a drink from a fridge
         4. Consume ALL of a drink from a fridge
         5. Go Back to Fridge Menu
         Select a number:
       HEREDOC
  user_descision = gets.chomp.to_i
  if user_descision == 1
    puts pp Fridge.find(fridge).drinks.all
  elsif user_descision == 2
    puts "What is the drink?"
    name = gets.chomp
    puts "How many ounces?"
    size = gets.chomp.to_i
    puts "Is it alcoholic? True or false?"
    alcholic = gets.chomp
    new_drink = Fridge.find(fridge).drinks.create(name: name, size: size, alcholic: alcholic)
    puts pp new_drink
  elsif user_descision == 3
    puts "Enter ID of drink you want to consume."
    drink_id = gets.chomp.to_i
    puts "How many ounces do you want in this drink?"
    ounces = gets.chomp.to_i
    drink = Fridge.find(fridge).drinks.find(drink_id)
    new_size = drink.size - ounces
    updated_drink = drink.update(size: new_size)
    puts pp drink
  elsif user_descision == 4
    puts "Enter ID of drink you want to consume."
    drink_id = gets.chomp.to_i
    Fridge.find(fridge).drinks.find(drink_id).destroy
    puts "Ahh, refreshing!"
    puts pp Fridge.find(fridge).drinks.all
  elsif user_descision == 5
    puts checkout_fridge(fridge)
  end

end
run_tracker