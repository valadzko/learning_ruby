height, username = nil

loop do 
  puts "Welcome! What is your name?"
  username = gets.chomp
  break unless  username.nil? || username.empty?
  puts "Error, your name can not be empty."
end

loop do
  puts "Please type your height:"
  height = gets.chomp
  if (height.to_i.to_s == height || height.to_f.to_s == height) && (height.to_f > 0)
    break
  else
    puts "Error! Your height is not a valid number."
  end
end

weight = height.to_f - 110

if weight >= 0
  puts "#{username}, your perfect weight is #{weight}"
else
  puts "Congratulations, #{username}! Your weight is perfect."
end
