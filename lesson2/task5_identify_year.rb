# 5. Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным. (Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?)

print "Ведите число: "
day = gets.chomp.to_i
print "Введите месяц: "
month = gets.chomp.to_i
print "Ведите год: "
year = gets.chomp.to_i

months_size = [31,28,31,30,31,30,31,31,30,31,30,31]
leap_year = false

if year.remainder(4) == 0
  leap_year = true
  if year.remainder(100) == 0 && year.remainder(400) != 0
    leap_year = false
  end
end

months_size = [31,28,31,30,31,30,31,31,30,31,30,31]
months_size[1] = 29 if leap_year

total_days = months_size.take(month - 1).sum + day

puts "Порядковый номер даты: #{total_days}"