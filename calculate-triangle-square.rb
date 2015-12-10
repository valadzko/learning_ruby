puts "Welcome!"

def input_value(field)
  loop do
    puts "Please, enter triangle #{field}:"
    value = gets.chomp
    return value.to_f if (value.to_f.to_s == value || value.to_i.to_s) && value.to_f > 0
    puts "Error, triangle #{field} must be a positive number"
  end
end


height = input_value "height"
base = input_value "base"

square = (height * base) / 2.0 

puts "Triangle square is #{square}"
