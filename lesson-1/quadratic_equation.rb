print "Введите коэффициент a: "
a = gets.chomp.to_i
print "Введите коэффициент b: "
b = gets.chomp.to_i
print "Введите коэффициент c: "
c = gets.chomp.to_i

# Вычисляем дискриминант D = (b^2 – 4ac)
d = (b*b - 4*a*c)

case 
when d > 0 # Если D > 0, то выводим дискриминант и 2 корня
  x1 = ((-1)*b + Math.sqrt(d))/(2*a)
  x2 = ((-1)*b - Math.sqrt(d))/(2*a)
  puts "Дискриминант равен #{d}, корень x1 равен #{x1}, корень x2 равен #{x2}."
when d == 0 # Если D = 0, то выводим дискриминант и 1 корень (т.к. корни в этом случае равны)
  x = (-1)*b/(2*a)
  puts "Дискриминант равен #{d}, корни равны #{x}."
when d < 0 # Если D < 0, то выводим дискриминант и сообщение "Корней нет"
  puts "Дискриминант равен #{d}, корней нет."
end
