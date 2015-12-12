puts "Welcome!"

def input_value(field)
  loop do
    puts "Please, enter triangle #{field}:"
    value = gets.to_f
    return value if value > 0
    puts "Error, triangle #{field} must be a positive number"
  end
end


height = input_value "height"
base = input_value "base"

square = (height * base) / 2.0 

puts "Triangle square is #{square}"
