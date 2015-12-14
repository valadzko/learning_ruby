fibbonacci = [1,1]
loop do
  next_number = fibbonacci[-1] + fibbonacci[-2]
  break if next_number > 100
  fibbonacci << next_number
end
