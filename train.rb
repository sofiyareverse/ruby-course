require_relative 'modules'

class Train
  attr_accessor :number, :station_now, :speed, :carriges, :brand
  
  @@train = []

  def self.find(num)
  	tr = @@train.select { |e| e.number == num }.first
  	if tr == nil
  		'Error.'
  	else
  		tr
  	end
  end

  def initialize(number)
    @number = number 
    @carriges = []
    @speed = 0
    brand
    @@train << self
  end

  def more_speed(amount)
    @speed += amount
  end

  def less_speed(amount)
    if @speed > 0
      @speed -= amount  
    else
      puts 'Error'
    end
  end

  def add_carrige(carrige)
    add_carrige!(carrige) if @speed.zero?
  end

  def remove_carrige
    remove_carrige! if @speed.zero?
  end

  def get_route(route)
    route.name
    route.station_list
  end

  def go_to_station(route, station_name)
    @station_now = route.station_select(station_name)
  end

  def show_nearest_stations(train, route, station_name)
    p 'Now: ' 
    train.station_now
    route.station_last(station_name)
    route.station_next(station_name)
  end
end
