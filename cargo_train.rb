class CargoTrain < Train
  include Company

  attr_accessor :carriges

  def add_carrige(carrige)
    add_carrige!(carrige)
  end

  def remove_carrige
    remove_carrige!
  end
end
