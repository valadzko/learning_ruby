require 'date'
puts "Please input year:"
year = gets.to_i
puts "Please input month number:"
month = gets.to_i
puts "Please input day:"
day = gets.to_i

months_days = [31,28,31,30,31,30,31,31,30,31,30,31]

# set February days to 29 if leap year
months_days[1] = 29 if year % 4 == 0

ydays = 0
(1..(month-1)).each { |i| ydays += months_days[i-1] } if month > 1
ydays += day
puts "#{ydays} day since the beginning of the year"
