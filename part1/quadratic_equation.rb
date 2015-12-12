puts "Welcome! This script will solve quadratic equation." 

def input_value(var_name)
  loop do
    puts "Please, enter coefficient  #{var_name}"
    value = gets.to_f
    return value unless value == 0
    puts "Error, #{var_name} must be a number"
  end
end

sides = []
puts "a(x^2) + bx + c == 0"
a = input_value "a" 
b = input_value "b"
c = input_value "c"

d = b ** 2 - 4 * a * c

if d > 0 
  puts "Discriminant = #{d}"
  x1 = (-b + Math.sqrt(d) ) / ( 2.0 * a )
  x2 = (-b - Math.sqrt(d) ) / ( 2.0 * a )
  puts "x1 = #{x1}, x2 = #{x2}"
elsif d == 0
  x = -b / ( 2.0 * a )
  puts "x1 == x2 == #{x}"
else 
  puts "No real roots!"
end
