# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

alphabet = {}

('a'..'z').to_a.each_with_index { |element, index| alphabet[element.to_sym] = index + 1 if element =~ /[aeiou]/ }

puts alphabet