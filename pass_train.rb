class PassTrain < Train
  include Company

  attr_writer :carriges

  def add_carrige(carrige)
    add_carrige!(carrige)
  end

  def remove_carrige
    remove_carrige!
  end
end
