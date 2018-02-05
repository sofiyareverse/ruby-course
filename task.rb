# Идеальный вес
puts 'Ваше имя?'
username = gets.chomp
puts 'Ваш вес?'
weigh = gets.chomp.to_i
puts 'Ваш рост?'
height = gets.chomp.to_i
idealHeigh = 110.to_i
if weigh <= height - idealHeigh # true
	puts username  +  ', у Вас уже идеальный вес. :)'
else # false
	puts username  + ', Идеальный вес для Вас:'
	puts height - idealHeigh
end

# Площадь треугольника
puts 'Каково основание?'
ohujevanie = gets.chomp.to_f
puts 'Впишите высоту треуголиника.'
hueta = gets.chomp.to_f
puts 'Площадь: '
puts 1.0 / 2.0 * ohujevanie * hueta

# Прямоугольный треугольник
puts 'Сторона a?'
a = gets.chomp.to_i
puts 'Сторона b?'
b = gets.chomp.to_i
puts 'Сторона c?'
c = gets.chomp.to_i

if a == b && b == c
	puts 'треугольник равнобедренный и равносторонний'
elsif a == b && b < c || b == c && c < a || c == a && a < b
	puts 'треугольник равнобедренный и прямоугольный'
elsif a > b && b > c || b > c && c > a || c > b && b > a || a > c && c > b || c > a && a > b || b > a && a > c
	puts 'треугольник прямоугольный'
else 
	puts 'треугольник равнобедренный'
end

# Квадратное уравнение
require "cmath"

puts 'Коэф. a?'
a = gets.chomp.to_i
puts 'Коэф. b?'
b = gets.chomp.to_i
puts 'Коэф. c?'
c = gets.chomp.to_i

d = b^2 - 4*a*c
c = CMath.sqrt(d)
if d > 0
	x1 = (-b + c)/(2*a)
	x2 = (-b - c)/(2*a)
	puts 'X1 = ' 
	puts x1
	puts 'X2 = ' 
	puts x2
elsif d == 0
	x1 = x2 = -b/(2*a)
	puts 'X1 = X2 = ' 
	puts x2
else d < 0
	puts 'корней НЕТ'
end
