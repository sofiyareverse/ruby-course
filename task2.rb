# месяцы
ha = {'январь': 31, 'февраль': 28, 'март': 31, 'апрель': 30, 'май': 31, 'июнь': 30, 'июль': 31,
		'август': 31, 'сентябрь': 30, 'октябрь':31, 'ноябрь': 30, 'декабрь': 31}
puts ha.select {|k,v| v == 31}

# с 10..100
range = (10..100)
for index in range
	puts index
end

# фибоначи
puts (1..10).inject( [0, 1] ) { | fib | fib << fib.last(2).inject(:+) } # [0, 1, adding_last + last, etc]

# letters
alf = {}
('A'..'Z').each_with_index do |k, v|
	puts alf = {k=>v+1}
end

# date
puts 'Введите день'
dd = gets.chomp.to_i
puts 'Введите номер месяца (например, январь = 1 или март = 3)'
mm = gets.chomp.to_i
puts 'Введите год'
yy = gets.chomp.to_i

days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30]

if yy%400 == 0
	days[1] = 29
end

nom_index=(mm-1) # index
puts days_in_mm = days[nom_index]
left_days = days_in_mm - dd
nom_dd=0
(0..nom_index).each {|el| nom_dd+=days[el]} # (0..index).each {|el| 0 +=days[el]}
puts nom_dd - left_days

# sum
to_break = ''
all = []
bucket = 0
puts 'Введите список покупок. Если Вы закончили, введите "стоп"'
while to_break != 'стоп' do
	puts 'Введите название товара'
	product = gets.chomp
	puts 'Введите стоимость товара за единицу'
	one_quantity = gets.chomp.to_i
	puts 'Введите количество единиц товара'
	quantity = gets.chomp.to_i
	puts 'Вы заказали:'
	total_price = one_quantity * quantity
	puts product + ' в количестве ' + quantity.to_s + ' общая сумма: ' + total_price.to_s
	all << [product: {quantity => total_price}]
	bucket += total_price
	puts 'Вы можете добавлять покупки. Чтоб продолжить, нажмите "enter". Если Вы закончили, введите "стоп".'
	to_break = gets.chomp
end

puts 'В корзине: ' 
puts bucket
