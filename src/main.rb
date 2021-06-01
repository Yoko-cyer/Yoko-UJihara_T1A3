#TTY prompy
require 'tty-prompt'
prompt = TTY::Prompt.new
#colorize
require 'colorize'
#artii
require "artii"
arter = Artii::Base.new
puts arter.asciify("Welcome!").cyan
require 'tty-table'

# define classes
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

# show menu table with with tty-table
table = TTY::Table.new(["Vegetarian sushi $3.7","Seafood sushi $4", "Meat sushi $4", "Hot Drinks $2"], 
  [["Avocado", "Salmon & Avocado", "Teriyaki chicken & Avocado", "Miso soup"], 
  ["Tempura Vegetabl", "Tuna & Avocado", "Crispy chicken", "Green tea"],
  ["Avocado & Cucumber", "Prawn & Avocado", "Teriyaki beef", "----"]])


vegetarian_sushi = [Sushi.new("Avocado", 3.7), Sushi.new("Tempura Vegetable", 3.7), Sushi.new("Avocado & Cucumber", 3.7)]
seafood_sushi = [Sushi.new("Salmon & Avocado", 4), Sushi.new("Tuna & Avocado", 4), Sushi.new("Prawn & Avocado", 4)]
meat_sushi = [Sushi.new("Teriyaki chicken & Avocado", 4), Sushi.new("Crispy chicken", 4), Sushi.new("Teriyaki beef", 4)]
hot_drinks = [Sushi.new("Miso soup", 2), Sushi.new("Green tea", 2)]

# show welcoming message
puts "Irassyaimase! Welcome to Yoko's Sushi. What is your name?".yellow 
name = gets.chomp
puts "Hello, #{name}. How can I help you today?"
puts "We have variety of sushi. If you buy 3 sushi then you will get 10% discount and free miso soup or hot green tea."
puts "Here are our menus."
puts table.render(:ascii)

#iterate through menu
def show_menu(menu_array)
  menu_array.each do |item| 
    puts item
  end
end

show_menu(vegetarian_sushi)
show_menu(seafood_sushi)
show_menu(meat_sushi)
show_menu(hot_drinks)

puts "Choose sushi what you like."

# allows to choose menu by categories
choices = ["Vegetarian sushi", "Seafood sushi", "Meat sushi", "Hot drinks"]
selection = prompt.multi_select("Select menu?", choices)  # returns array

total_price = 0
chosen_items = []

# ordering

def menu_selection(tty_prompt, menu_type, total_price, chosen_items, v_sushi, s_sushi, m_sushi, drinks)
  if menu_type == "vege"
    menu_array = v_sushi
    selection = tty_prompt.multi_select("Select vegetarian sushi", ["Avocado", "Tempura Vegetable", "Avocado & Cucumber"])
    confirmation_massage = "Are you sure you want these sushi? Yes or No?"
    confirm = tty_prompt.yes?(confirmation_massage)

  elsif menu_type == "seafood"
    menu_array = s_sushi
    selection = tty_prompt.multi_select("Select seafood sushi", ["Salmon & Avocado", "Tuna & Avocado", "Prawn & Avocado"])
    confirmation_massage = "Are you sure you want these sushi? Yes or No?"
    confirm = tty_prompt.yes?(confirmation_massage)
  
  elsif menu_type == "meat"
    menu_array = m_sushi
    selection = tty_prompt.multi_select("Select meat sushi", ["Teriyaki chicken & Avocado", "Crispy chicken", "Teriyaki beef"])
    confirmation_massage = "Are you sure you want these sushi? Yes or No?"
    confirm = tty_prompt.yes?(confirmation_massage)
  else
    menu_array = drinks
    selection = tty_prompt.multi_select("Select hot drinks", ["Miso soup", "Green tea"])
    confirmation_massage = "Are you sure you want these sushi? Yes or No?"
    confirm = tty_prompt.yes?(confirmation_massage)

  end
  
  if confirm 
    menu_array.each do |item|
      puts item
      selection.each do |choice|
        puts choice
        if choice == item.name
          # puts "total price: #{total_price}"
          puts "item price: #{item.price}"
          puts "total price: #{total_price}"
          chosen_items.push(item)
          total_price += item.price
        end
      end
      return total_price
    end
  elsif confirmation == "No"
    puts "Please choose again."
  else 
    puts "Please answer yes or no."
  end
end



selection.each do |s|
  case s
    when "Vegetarian sushi"
      sushi_type = "vege"
      total_price = menu_selection(prompt, sushi_type, 0, chosen_items, vegetarian_sushi, seafood_sushi, meat_sushi, hot_drinks)
      
    when "Seafood sushi"
      sushi_type = "seafood"
      total_price = menu_selection(prompt, sushi_type, 0, chosen_items, vegetarian_sushi, seafood_sushi, meat_sushi, hot_drinks)
      # puts "meat"
    when "Meat sushi"
      sushi_type = "meat"
      total_price = menu_selection(prompt, sushi_type, 0, chosen_items, vegetarian_sushi, seafood_sushi, meat_sushi, hot_drinks)
    when "Hot drinks"
      sushi_type = "drinks"
      total_price = menu_selection(prompt, sushi_type, 0, chosen_items, vegetarian_sushi, seafood_sushi, meat_sushi, hot_drinks)
  end
end

# show bills

puts "Here's your bill."
chosen_items.each do |item|
  puts item
end
puts "Total is $#{total_price}".red
puts "Arigato gozaimashita. Thank you, have a nice day!".blue

