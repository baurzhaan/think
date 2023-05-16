=begin

Площадь треугольника. 
Площадь треугольника можно вычислить, зная его основание (a) и высоту (h) по формуле: 1/2*a*h. Программа должна запрашивать основание и высоту треугольника и возвращать его площадь.

=end

print "Enter the base of a triangle: "
base = gets.chomp.to_f

print "Enter the height of a triangle: "
height = gets.chomp.to_f

area =  base * height * 0.5

puts "The area of the triangle: #{area}"
