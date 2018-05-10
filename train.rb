class Train
  attr_accessor :number, :carriges
  attr_reader :number, :station_now, :speed, :carriges

  def initialize(number)
    @number = number 
    @carriges = []
    @speed = 0
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

  def find(number)
  	
  end

  def add_carrige
    add_carrige! if @speed.zero?
  end

  def remove_carrige
    remove_carriage! if @speed.zero?
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
