vowels_indexes = {}
vowels_list = "aeuyio"
('a'..'z').each_with_index do |letter, index|
  vowels_indexes[letter] = index + 1 if vowels_list.include? letter
end
