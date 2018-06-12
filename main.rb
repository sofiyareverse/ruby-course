require_relative 'train'
require_relative 'carrige'
require_relative 'pass_train'
require_relative 'pass_carrige'
require_relative 'cargo_train'
require_relative 'cargo_carrige'
require_relative 'station'
require_relative 'route'
require 'byebug'

puts 'Добаьте начальную и конечную станцию'
puts 'Введите имя первой станции'
station_first = Station.new(gets.chomp)
puts 'Введите имя конечной станции'
station_last = Station.new(gets.chomp)
puts 'Добаьте название пути для дальнейшей его обработки.'
route = Route.new(gets.chomp, station_first, station_last)
puts '______________________________________________________'

to_break = ''
while to_break != '10' do
  puts '______________________________________________________'
  puts 'создать грузовой поезд, нажмите "0"'
  puts 'создать пассажирский поезд, нажмите "1"'
  puts 'добавить промежуточную станцию, нажмите "2"'
  puts 'поместить поезд на станцию, нажмите "3"'
  puts 'посмотреть список поездов на станции, нажмите "4"'
  puts 'посмотреть список станций, нажмите "5"'
  puts 'поставьте "6", чтоб добавить вагон (вывести список), поставьте "7",чтоб убрать вагон'
  puts 'Занимать место или объем в вагоне: "8"'
  puts 'Добавить новый тип вагона: "9"'
  puts '______________________________________________________'
  action = gets.chomp
  case action
  when '0'
    begin
      puts 'Введите номер грузового поезда'
      number = gets.chomp
      cargo_train = CargoTrain.new(number)
      puts "Ваш номер поезда: #{cargo_train.number}"
    rescue => e
      puts e.message
      retry
    end
  when '1'
    begin
      puts 'Введите номер пассажирского поезда'
      number = gets.chomp
      pass_train = PassTrain.new(number)
      puts "Ваш номер поезда: #{pass_train.number}"
    rescue => e
      puts e.message
      retry
    end
  when '2'
    puts 'Введите имя промежуточной станции'
    middle_station = Station.new(gets.chomp)
    route.add_middle_station(middle_station)
    puts "Промежуточная станция: #{middle_station.name}"
  when '3'
    puts "Станции: #{Station.all}"
    puts 'Введите название станцaии, на которую хотите отправить поезд.'
    station_now = gets.chomp
    station = route.station_select(station_now).first
    puts "Выберите из списка номер поезда, который хотите использовать: #{Train.all}."
    puts 'Сейчас введите номер:'
    train = Train.find(gets.chomp)
    train.go_to_station(route, station_now)
    station.add_train(train)
    puts "Поезд на станции #{station_now}"
    station.all_trains(station) { |t| puts t }
  when '4'
    puts "На станции сейчас: № #{station.trains_on_station}"
  when '5'
    puts "Станции: #{route.station_names}"
  when '6'
    puts 'посмотреть список вагонов - "1", добавить вагон к поезду - "2"'
    act = gets.chomp
    case act
    when '1'
      puts "Список вагонов: #{Carrige.all}"
    when '2'
      puts "Выберите из списка номер поезда, который хотите использовать: #{Train.all}."
      puts 'Сейчас введите номер:'
      train = Train.find(gets.chomp)
      puts "Список вагонов: #{Carrige.all}"
      puts 'Введите номер вагона, который хотите прицепить: '
      num = gets.chomp.to_i
      find_num = Carrige.find(num)
      if find_num.nil?
        puts 'Carrige does not exist.'
      else
        train.add_carrige(find_num)
        puts '+1'
        train.all_carriges(train) { |c| puts c }
      end
    else
      'Error.'
    end
  when '7'
    puts "Выберите из списка номер поезда, который хотите использовать: #{Train.all}."
    puts 'Сейчас введите номер:'
    train = Train.find(gets.chomp)
    puts cargo_train.remove_carrige
  when '8'
    if train.class.name == 'PassTrain'
      carrige.place_or_seat_amount do
        puts "Общее количество мест: #{carrige.seats}"
        puts "Свободно мест: #{carrige.free_seats}"
        puts "Занято мест: #{carrige.taken_seats}"
      end
      puts 'Введите количество необходимого места: '
      carrige.take_place(gets.chomp).take_seat
    elsif train.class.name == 'CargoTrain'
      carrige.place_or_seat_amount do
        puts "Общее количество мест: #{carrige.place}"
        puts "Свободно мест: #{carrige.free_place}"
        puts "Занято мест: #{carrige.taken_place}"
      end
      carrige.take_place(gets.chomp)
    end
  when '9'
    puts 'Введите тип поезда: "1" - пассажирский, "2" - грузовой'
    type = gets.chomp
    case type
    when '1'
      puts 'Сейчас введите кол-во мест в вагоне:'
      carrige = PassCarrige.new(gets.chomp)
    when '2'
      puts 'Сейчас введите кол-во мест в вагоне:'
      carrige = CargoCarrige.new(gets.chomp)
    else
      'Error.'
    end
  else
    puts 'Чтоб продолжить, нажмите "enter". Если Вы закончили, введите "10".'
    to_break = gets.chomp
  end
end
