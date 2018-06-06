require_relative 'company'
require_relative 'validation'

class Train
  attr_accessor :number, :station_now, :speed, :carriges, :brand
  include Validator
  TRAIN_NUMBER_FORMAT = /^[а-яa-z0-9]{3}-*[а-яa-z0-9]{2}$/i
  
  @attempt = 0
  @@train = []

  def self.all
    @@train.map { |t| { number: t.number, type: t.class.name, carriges: t.carriges } }
  end

  def self.find(num)
    tr = @@train.select { |e| e.number == num }.first
    if tr.nil?
      'Error.'
    else
      tr
    end
  end

  def valid?(obj)
    name_valid?(obj)
  end

  def initialize(number)
    @number = number
    valid?(number)
    @carriges = []
    @speed = 0
    brand
    @@train << self
  end

  def all_carriges
    p 'Вагоны в поезде:  '
    yield
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

  protected

  def add_carrige!(carrige)
    @carriges << carrige if @speed.zero?
  end

  def remove_carrige!
    @carriges.pop if @speed.zero?
  end
end
