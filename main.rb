require_relative 'train'
require_relative 'carrige'
require_relative 'pass_train'
require_relative 'pass_carrige'
require_relative 'cargo_train'
require_relative 'cargo_carrige'
require_relative 'station'
require_relative 'route'

puts 'Добаьте начальную и конечную станцию'
puts 'Введите имя первой станции'
station_first = Station.new(gets.chomp)
puts 'Введите имя конечной станции'
station_last = Station.new(gets.chomp)
puts 'Добаьте название пути для дальнейшей его обработки.'
route = Route.new(gets.chomp, station_first, station_last)
puts '______________________________________________________'

action = ''
to_break = ''
while to_break != '9' do
  puts '______________________________________________________'
  puts 'создать грузовой поезд, нажмите "0"'
  puts 'создать пассажирский поезд, нажмите "1"'
  puts 'добавить промежуточную станцию, нажмите "2"'
  puts 'поместить поезд на станцию, нажмите "3"'
  puts 'посмотреть список поездов на станции, нажмите "4"'
  puts 'посмотреть список станций, нажмите "5"'
  puts 'поставьте "6", чтоб добавить вагон, поставьте "7",чтоб убрать вагон'
  puts '______________________________________________________'
  action = gets.chomp
  if action == '0'
    puts 'Введите номер грузового поезда'
    cargo_train = CargoTrain.new(gets.chomp)
    puts "Ваш номер поезда: #{cargo_train.number}"
  elsif action == '1'
    puts 'Введите номер пассажирского поезда'
    pass_train = PassTrain.new(gets.chomp)
    puts "Ваш номер поезда: #{pass_train.number}"
  elsif action == '2'
    puts 'Введите имя промежуточной станции'
    middle_station = Station.new(gets.chomp)
    route.add_middle_station(middle_station)
    puts "Промежуточная станция: #{middle_station.name}"
  elsif action == '3'
    puts 'Введите название станции, на которую хотите отправить поезд.'
    station_now = gets.chomp
    station = route.station_select(station_now).first
    if !cargo_train.nil?
      cargo_train.go_to_station(route, station_now) unless cargo_train.nil?
      station.add_train(cargo_train)
      puts "Поезд на станции #{station_now}"
    elsif !pass_train.nil?
      pass_train.go_to_station(route, station_now) unless pass_train.nil?
      station.add_train(pass_train)
      puts "Поезд на станции #{station_now}"
    else
      puts 'Error. Поезда не существует.'
    end
  elsif action == '4'
    puts "На станции сейчас: № #{station.trains_on_station}"
  elsif action == '5'
    puts "Станции: #{route.station_names}"
  elsif action == '6'
    if !cargo_train.nil? || !pass_train.nil?
      carrige = Carrige.new
      cargo_train.add_carrige(carrige) unless cargo_train.nil?
      pass_train.add_carrige(carrige) unless pass_train.nil?
      puts '+1'
    elsif cargo_train.nil? && pass_train.nil?
      puts 'Error. Поезда не существует.'
    end
  elsif action == '7'
    if !cargo_train.nil? || !pass_train.nil?
      puts cargo_train.remove_carrige unless cargo_train.nil?
      puts c = pass_train.remove_carrige unless pass_train.nil?
      if !c.nil?
        puts '-1'
      elsif c.nil?
        puts 'Error. There is no carriges'
      end
    elsif cargo_train.nil? && pass_train.nil?
      puts 'Error. Поезда не существует.'
    end
  else
    puts 'Чтоб продолжить, нажмите "enter". Если Вы закончили, введите "9".'
    to_break = gets.chomp
  end
end
