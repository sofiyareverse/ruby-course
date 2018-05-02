class Station
  @station_trains = []
  class << self
  	attr_accessor :name
  	attr_reader :name

	  def new(name)
	  	@name = name
	  end

	  def add_train
	  	@station_trains << { number: Train.number, type: Train.type }
	  end

	  def remove_train(number)
	  	@station_trains.delete_if { |x| x[:number] == number }
	  end

	  def trains_on_station
	  	@station_trains
	  end

	  def trains_type_on_station(type)
	  	@station_trains.select {|e| e[:type] == type}.count
	  end
  end
end

class Route
	@station_list = []
	class << self
	  attr_accessor :name
	  attr_reader :name, :station_list, :station_select, :station_find

	  def new(name)
	  	@name = name
	  end

	  def add_new_route(first_station, last_station)
	  	@station_list << Station.new(first_station)
	  	@station_list << Station.new(last_station)
	  end

	  def stations_list
	  	@station_list
	  end

	  def station_select(obj)
	  	@station_select = @station_list.select {|e| e == obj}
	  end

	  def station_last
	  	ind = Route.stations_list.index(Train.station_now.join.to_s)-1
	  	p "Last: "
	  	if ind == -1 
	  		return nil
	  	else
		  	@station_list[ind]
		  end
	  end

	  def station_next
	  	ind = Route.stations_list.index(Train.station_now.join.to_s)+1
	  	p "Next: "
	  	@station_list[ind]
	  end

	  def add_middle_station(station)
	  	@station_list.insert(1, Station.new(station))
	  end

	  def remove_middle_station(station)
	  	@station_list.delete(station)
	  end
	end
end

class Train
	@speed = 0
	@carriages = 0
	class << self
	  attr_accessor :number, :type, :carriages
	  attr_reader :number, :type, :station_now

	  def new(number, type, carriages)
	  	@number = number
	  	@type = type
	    @carriages = carriages
	  end

	  def speed_now
	  	@speed
	  end

	  def more_speed(amount)
	  	@speed += amount
	  end

	  def less_speed(amount)
	  	@speed -= amount 
	  end

	  def carriage_list
	  	@carriages
	  end

	  def add_carriage(amount)
	  	@carriages += amount if @speed == 0
	  end

	  def remove_carriage(amount)
	  	@carriages -= amount if @speed == 0
	  end

	  def get_route
	  	Route.name
	  	Route.station_list
	  end

	  def go_to_station(station)
	  	@station_now = Route.station_select(station)
	  end

	  def show_nearest_stations
	  	p Now: Train.station_now
	  	Train.station_last_and_next
	  end
	end
end
