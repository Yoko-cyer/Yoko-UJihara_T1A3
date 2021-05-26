require 'tty-prompt'
prompt = TTY::Prompt.new

class Sushi
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    return "#{name} is $#{price}."
  end
end

vegetarian_sushi = [Sushi.new("Avocado", 3.7), Sushi.new("Tempura Vegetable", 3.7), Sushi.new("Avocado & Cucumber", 3.7)]
seafood_sushi = [Sushi.new("Salmon & Avocado", 4), Sushi.new("Tuna & Avocado", 4), Sushi.new("Prawn & Avocado", 4)]
meat_sushi = [Sushi.new("Teriyaki chicken & Avocado", 4), Sushi.new("Crispy chicken", 4), Sushi.new("Teriyaki beef", 4)]
hot_menu = [Sushi.new("Miso soup", 2), Sushi.new("Green tea", 2)]

puts "Irassyaimase! Welcome to Yoko's Sushi. What is your name?"
name = gets.chomp
puts "Hello, #{name}. How can I help you today?"
puts "We have variety of sushi. If you buy 3 sushi then you will get 10% discount and free miso soup or hot green tea."
puts "Each sushi costs $4 and hot menus for $2. Here are our menus"

choices = %w(vegetarian\ sushi seafood\ sushi meat\ sushi drinks)
selection = prompt.multi_select("Select sushi?", choices)  # returns array

selection.each do |s|
  case s
    when "vegetarian sushi"
    # puts "vege"
      vegetarian_sushi.each do |vege|
        puts vege
      end
    # puts "seafood"
    when "seafood sushi"
      seafood_sushi.each do |seafood|
        puts seafood
    end
    # puts "meat"
    when "meat sushi"
      meat_sushi.each do |meat|
    end

    when "hot_menu"
      hot_menu.each do |hot|
  end
end


# class Menu
#     attr_accessor :name
#     attr_accessor :price
    
#     def initialize(name:, price:)
#       self.name = name
#       self.price = price
#     end
    
#     def info
#       return "#{self.name} $#{self.price}"
#     end
    
#     def get_total_price(count)
#       total_price = self.price * count
#       if count >= 3
#         total_price -= 1
#       end
#       return total_price
#     end
# end


# vegetarian_sushi.each do |sushi|
#   puts "#{sushi}"






