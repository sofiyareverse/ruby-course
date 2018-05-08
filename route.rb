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

  def station_names
    @stations_list.map {|e| e.name }
  end

  def station_last(station_name)
    ind = @stations_list.index{ |s| s.name == station_name }-1
    p 'Last: '
    if ind == -1 
      return nil
    else
      @stations_list[ind]
    end
  end

  def station_next(station_name)
    ind = @stations_list.index{ |s| s.name == station_name }+1
    p 'Next: '
    @stations_list[ind]
  end

  def add_middle_station(middle_station)
    @stations_list.insert(1, middle_station)
  end

  def remove_middle_station(station_name)
    @stations_list.delete(station_name)
  end
end
