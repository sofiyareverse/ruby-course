# Идеальный вес
puts 'Ваше имя?'
username = gets
puts 'Ваш вес?'
weigh = gets.to_i
puts 'Ваш рост?'
height = gets.to_i
idealHeigh = 110.to_i
if weigh <= height - idealHeigh 
	puts username  +  ', у Вас уже идеальный вес. :)'
else
	puts username  + ', Идеальный вес для Вас:'
	puts height - idealHeigh
end

# Площадь треугольника
puts 'Каково основание?'
ohujevanie = gets.to_f
puts 'Впишите высоту треуголиника.'
hueta = gets.to_f
puts 'Площадь: '
puts 1.0 / 2.0 * ohujevanie * hueta

# Прямоугольный треугольник
puts 'Сторона a?'
a = gets.to_i
puts 'Сторона b?'
b = gets.to_i
puts 'Сторона c?'
c = gets.to_i

[a, b, c]

a, b, c = [a, b, c].sort

if c**2 == a**2+b**2 && a == b
	puts 'треугольник прямоугольный и равнобедренный'
elsif c**2 == a**2+b**2 && a != b
	puts 'треугольник прямоугольный'
elsif a == b && b == c
		puts 'треугольник равносторонний'
else # другое (например, некорректные данные)
    puts 'треугольник невалидный'
end

# Квадратное уравнение
require "cmath"

puts 'Коэф. a?'
a = gets.to_i
puts 'Коэф. b?'
b = gets.to_i
puts 'Коэф. c?'
c = gets.to_i

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
