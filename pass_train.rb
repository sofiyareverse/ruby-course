class PassTrain < Train
  include Company

  attr_accessor :seats, :free_seats, :taken_seats

  def add_carrige(carrige)
    add_carrige!(carrige)
  end

  def remove_carrige
    remove_carrige!
  end
end
