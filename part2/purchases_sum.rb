purchases = {}
loop do 
	puts "Please enter item name (or type 'stop'):" 
  item = gets.chomp
  break if item == 'stop'
  puts "Please enter #{ item } price:"
  price = gets.to_f
  puts "Please enter #{ item } amount:"
  amount = gets.to_f
  purchases[item] = { price: price, amount: amount }
end

total_price = 0
purchases.each do |name, data|
  item_total_price = data[:price].to_f * data[:amount].to_f
	puts "Item = #{ name }, price = #{ data[:price] }, amount = #{ data[:amount] }"
  puts "Total price for #{ name } = #{ item_total_price } " 
  total_price += item_total_price
end
puts "Sum of all items: #{ total_price }"
