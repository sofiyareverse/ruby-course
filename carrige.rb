require_relative 'company'
require_relative 'validation'

class Carrige
  include Company
  include Validator

  attr_accessor :number
  attr_writer :brand

  TRAIN_NUMBER_FORMAT = /^[0-9]*$/

  @carrige = []

  class << self
    attr_reader :carrige
  end

  def carrige
    self.class.carrige
  end

  def self.all
    @carrige.map { |t| { number: t.number, type: t.class.name, place_or_seat: t.seats || t.place } }
  end

  def self.find(num)
    carrige = @carrige.select { |e| e.number == num }.first
    carrige.nil? ? 'Error.' : carrige
  end

  def initialize(obj)
    place_or_seat(obj)
    name_format_error(obj)
    brand
    Carrige.carrige << self
    @number = rand(5..30)
  end

  def place_or_seat_amount
    yield
  end
end
