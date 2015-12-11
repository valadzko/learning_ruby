height, username = nil

loop do 
  puts "Welcome! What is your name?"
  username = gets.chomp
  break unless  username.nil? || username.empty?
  puts "Error, your name can not be empty."
end

loop do
  puts "Please type your height:"
  height = gets.to_f
  break if height > 0
  puts "Error! Your height is not a valid number."
end

weight = height.to_f - 110

if weight >= 0
  puts "#{username}, your perfect weight is #{weight}"
else
  puts "Congratulations, #{username}! Your weight is perfect."
end
