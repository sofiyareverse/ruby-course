require_relative 'modules'
require_relative 'validation'

class Station
  include Main
  include Validator
  attr_accessor :name, :trains

  @stations_list = []

  class << self
    attr_reader :stations_list
  end

  def stations_list
    self.class.stations_list
  end

  def self.all
    @stations_list.map(&:name)
  end

  def valid?(obj)
    name_valid?(obj)
  end

  def initialize(name)
    @name = name
    valid?(name)
    @trains = []
    Station.stations_list << self
  end

  def all_trains
    puts 'На станции сейчас: '
    yield
  end

  def add_train(train)
    @trains << train
  end

  def remove_train(station, num)
    station.trains.delete_if { |t| t.number == num }
  end

  def trains_type_on_station(train_type)
    @trains.select { |e| e.type == train_type }.count
  end
end
