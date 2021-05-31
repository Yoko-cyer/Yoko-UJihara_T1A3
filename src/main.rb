require 'tty-prompt'
prompt = TTY::Prompt.new

class MenuItem
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    return "#{name}: $#{price}."
  end
end

class Sushi < MenuItem
 
end

class Drink < MenuItem
  
end


vegetarian_sushi = [Sushi.new("Avocado", 3.7), Sushi.new("Tempura Vegetable", 3.7), Sushi.new("Avocado & Cucumber", 3.7)]
seafood_sushi = [Sushi.new("Salmon & Avocado", 4), Sushi.new("Tuna & Avocado", 4), Sushi.new("Prawn & Avocado", 4)]
meat_sushi = [Sushi.new("Teriyaki chicken & Avocado", 4), Sushi.new("Crispy chicken", 4), Sushi.new("Teriyaki beef", 4)]
hot_menu = [Sushi.new("Miso soup", 2), Sushi.new("Green tea", 2)]

puts "Irassyaimase! Welcome to Yoko's Sushi. What is your name?"
name = gets.chomp
puts "Hello, #{name}. How can I help you today?"
puts "We have variety of sushi. If you buy 3 sushi then you will get 10% discount and free miso soup or hot green tea."
puts "Here are our menus."

#iterate through menu
def show_menu(menu_array)
  menu_array.each do |item| 
    puts item
  end
end

show_menu(vegetarian_sushi)
show_menu(seafood_sushi)
show_menu(meat_sushi)
show_menu(hot_menu)

puts "Choose sushi what you like."

choices = ["Vegetarian sushi", "Seafood sushi", "Meat sushi", "Hot drinks"]
selection = prompt.multi_select("Select menu?", choices)  # returns array

total_price = 0
chosen_sushi = []

selection.each do |s|
  case s
    when "Vegetarian sushi"
    # puts "vege"
      vegetarian_selection = prompt.multi_select("Select vegetarian sushi", ["Avocado", "Tempura Vegetable", "Avocado & Cucumber"])
      puts "Are you sure you want these sushi?"
      confirmation = gets.chomp.capitalize
        if confirmation == "Yes"
          vegetarian_sushi.each do |sushi|

            vegetarian_selection.each do |choice|
              if choice == sushi.name
                total_price += sushi.price
                chosen_sushi.push(sushi)
              end
            end

          end
        elsif confirmation == "No"
          puts "No"
          vegetarian_selection
        end
      # puts "seafood"
    when "Seafood sushi"
      prompt.multi_select("Select seafood sushi", ["Avocado1", "Tempura Vegetable1", "Avocado & Cucumber1"])
      puts "Are you sure you want these sushi?"
      # puts "meat"
    when "Meat sushi"
      meat_sushi.each do |meat|
        puts meat
    end

    when "Hot drinks"
      hot_menu.each do |hot|
        puts hot
    end
  end
end
puts "Here's your bill."
chosen_sushi.each do |sushi|
  puts sushi
end
puts "Total is $#{total_price}"
puts "Arigato gozaimashita. Thank you, have a nice day!"
# vege_choices = Sushi.new("Avocado", 3.7), Sushi.new("Tempura Vegetable", 3.7), Sushi.new("Avocado & Cucumber", 3.7)
# selection = prompt.multi_select("Select menu?", choices)  # returns array
