=begin

Идеальный вес. 
Программа запрашивает у пользователя имя и рост и выводит идеальный вес по формуле (<рост> - 110) * 1.15, после чего выводит результат пользователю на экран с обращением по имени. Если идеальный вес получается отрицательным, то выводится строка "Ваш вес уже оптимальный"

=end

print "Please enter your name: "
name = gets.chomp

print "How tall you are (in cm)?: "
current_height = gets.chomp.to_f

ideal_weight = (current_height - 110) * 1.15

puts ideal_weight < 0 ? "Hello #{name}. Your current weight is optimal." : "Hello #{name}. Ideal weight for you is #{ideal_weight.round(2)}"