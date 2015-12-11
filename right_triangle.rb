puts "Welcome! This script will tell you if your triangle is right." 

def input_value(index)
  loop do
    puts "Please, enter #{index} triangle side lenght"
    value = gets.chomp
    return value.to_f if (value.to_f.to_s == value || value.to_i.to_s) && value.to_f > 0
    puts "Error, triangle side lenght must be a positive number"
  end
end

sides = []
%w(first second third).each {|index| sides.push input_value index} 

#check if triangle is right using Pythagorian theorem
hypotenuse = sides.max
sides.delete hypotenuse

#check if input parameters are correct for a triangle 
if sides[0] + sides[1] <= hypotenuse 
  puts "Error, this is not a triangle at all. a + b <= c"
  abort 
end

if hypotenuse ** 2 == sides[0] ** 2 + sides[1] ** 2 
  puts "Your triangle is right"
else 
  puts "Your triange is not right"
end
puts "Moreover, triangle is isosceles" if sides[0] == sides[1]


