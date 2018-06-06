require_relative 'validation'

class Route
  include Validator
  attr_accessor :name, :stations_list

  def valid?(obj)
    name_valid?(obj)
  end

  def initialize(name, first_station, last_station)
    @name = name
    valid?(name)
    @stations_list = []
    @stations_list << first_station
    @stations_list << last_station
  end

  def station_select(station_name)
    @station_select = @stations_list.select { |e| e.name == station_name }
  end

  def station_names
    @stations_list.map(&:name)
  end

  def station_last(station_name)
    ind = @stations_list.index { |s| s.name == station_name } - 1
    p 'Last: '
    ind == -1 ? nil : @stations_list[ind]
  end

  def station_next(station_name)
    ind = @stations_list.index { |s| s.name == station_name } + 1
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
