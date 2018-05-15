require_relative 'company'

class Carrige
  include Company
  attr_writer :brand

  def initialize
    brand
  end
end
