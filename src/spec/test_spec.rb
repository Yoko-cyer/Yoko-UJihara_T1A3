# require 'rspec'
require_relative '../method'

describe "calculate discount" do
    it "should calculate 10% discount" do 
        actual = calclate_discount(100)
        expect(actual).to eq(90) 
    end
end 

describe "calculate drink discount" do
    it "should apply -$2 deal" do 
        actual = calculate_drink_discount(10)
        expect(actual).to eq(8) 
    end
end 