def calclate_discount(price)
    discount = price * 0.1
    return price -= discount
end

def calculate_drink_discount(price)
    price -= 2
    return price
end