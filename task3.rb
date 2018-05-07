class Station
	attr_accessor :name
	attr_reader :name, :trains
  def initialize(name)
  	@name = name
  	@trains = []
  end

  def add_train(train)
  	@trains << train
  end

  def remove_train(station, num)
  	station.trains.delete_if { |t| t.number == num}
  end

  def trains_type_on_station(train_type)
  	@trains.select {|e| e.type == train_type}.count
  end
end

class Route
  attr_accessor :name
  attr_reader :name, :station_select, :stations_list

  def initialize(name, first_station, last_station)
  	@name = name
  	@stations_list = []
  	@stations_list << first_station
  	@stations_list << last_station
  end

  def station_select(station_name)
  	@station_select = @stations_list.select {|e| e.name == station_name}
  end

  def station_last(station_name)
  	ind = @stations_list.index{ |s| s.name == station_name }-1
  	p "Last: "
  	if ind == -1 
  		return nil
  	else
	  	@stations_list[ind]
	  end
  end

  def station_next(station_name)
  	ind = @stations_list.index{ |s| s.name == station_name }+1
  	p "Next: "
  	@stations_list[ind]
  end

  def add_middle_station(middle_station)
  	@stations_list.insert(1, middle_station)
  end

  def remove_middle_station(station_name)
  	@stations_list.delete(station_name)
  end
end

class Train
  attr_accessor :number, :type, :carriages
  attr_reader :number, :type, :station_now, :speed

  def initialize(number, type, carriages)
  	@number = number
  	@type = type
    @carriages = carriages
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

  def add_carriage(amount)
  	@carriages += amount if @speed == 0
  end

  def remove_carriage(amount)
  	@carriages -= amount if @speed == 0
  end

  def get_route(route)
  	route.name
  	route.station_list
  end

  def go_to_station(route, station_name)
  	@station_now = route.station_select(station_name)
  end

  def show_nearest_stations(train, route, station_name)
  	p Now: train.station_now
  	route.station_last(station_name)
  	route.station_next(station_name)
  end
end
