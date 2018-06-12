require_relative 'company'
require_relative 'validation'

class Carrige
  include Company
  include Validator

  attr_accessor :number
  attr_writer :brand

  TRAIN_NUMBER_FORMAT = /^[0-9]*$/

  @@carrige = []

  def self.all
    @@carrige.map { |t| { number: t.number, type: t.class.name, place_or_seat: t.seats || t.place } }
  end

  def self.find(num)
    carrige = @@carrige.select { |e| e.number == num }.first
    if carrige.nil?
      nil
    else
      carrige
    end
  end

  def initialize(obj)
    place_or_seat(obj)
    name_format_error(obj)
    brand
    @@carrige << self
    @number = rand(5..30)
  end

  def place_or_seat_amount
    yield
  end
end
