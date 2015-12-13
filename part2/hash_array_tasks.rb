# 1
months = { january: 31, february: 28, march: 31, april:30, may:31, june: 30, july:31, august:31, september:30, october:31, november:30, december:31}
months.each {|month,days| puts month if days > 30}

# 2
arr = []
(10..100).step(5).each { |x| arr << x }

# 3
fibbonacci = [1,1]
loop do
  next_number = fibbonacci[-1] + fibbonacci[-2]
  break if next_number > 100
  fibbonacci << next_number
end

# 4
vowels_indexes = {}
vowels_list = "aeuyio"
('a'..'z').each_with_index do |letter, index|
  vowels_indexes[letter] = index + 1 if vowels_list.include? letter 
end

# 5 
require 'date'
puts "Please input year:"
year = gets.to_i
puts "Please input month number:"
month = gets.to_i
puts "Please input day:"
day = gets.to_i

puts Time.new(year, month, day).yday.to_s
