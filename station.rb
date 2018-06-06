require_relative 'modules'
require_relative 'validation'

class Station
  include Main
  include Validator
  attr_accessor :name, :trains

  @@stations_list = []

  def self.all
    @@stations_list.map(&:name)
  end

  def valid?(obj)
    name_valid?(obj)
  end

  def initialize(name)
    @name = name
    valid?(name)
    @trains = []
    @@stations_list << self
  end

  def all_trains(trains)
    puts 'На станции сейчас: '
    yield(trains)
  end

  def add_train(train)
    @trains << train
  end

  def remove_train(station, num)
    station.trains.delete_if { |t| t.number == num }
  end

  def trains_on_station
    @trains.map(&:number)
  end

  def trains_type_on_station(train_type)
    @trains.select { |e| e.type == train_type }.count
  end
end
