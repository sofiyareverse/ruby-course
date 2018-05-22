class CargoTrain < Train
  include Company

  attr_accessor :place, :free_place, :taken_place, :carriges

  def place_or_seat(place)
    @place = place.to_i
    number_valid?(place)
    @free_place = @place
    @taken_place = 0
	end

  def add_carrige(carrige)
    add_carrige!(carrige)
  end

  def remove_carrige
    remove_carrige!
  end

  def take_place(amount)
    @free_place -= amount if @free_place > 0 && amount < @free_place
    @taken_place += amount if @taken_place < @place
  end
end
