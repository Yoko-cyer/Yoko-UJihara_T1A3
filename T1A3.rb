class Menu
    attr_accessor :name
    attr_accessor :price
    
    def initialize(name:, price:)
      self.name = name
      self.price = price
    end
    
    def info
      return "#{self.name} $#{self.price}"
    end
    
    def get_total_price(count)
      total_price = self.price * count
      if count >= 3
        total_price -= 1
      end
      return total_price
    end
  end


puts "Irassyaimase! Welcome to Yoko's Sushi. What is your name?"
name = gets.chomp
puts "Hello, #{name}. How can I help you today?"
puts "We have variety of sushi. If you buy 3 sushi then you will get 10% discount and free miso soup or hot green tea."
puts "Here is our menu"

class Menu
    attr_accessor :name
    attr_accessor :price
    
    def initialize(name:, price:)
        


