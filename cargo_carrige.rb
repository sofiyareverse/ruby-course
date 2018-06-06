class CargoCarrige < Carrige
  include Company

  attr_accessor :place, :free_place, :taken_place

  def place_or_seat(place)
    @place = place.to_i
    @free_place = @place
    @taken_place = 0
  end

  def take_place(amount)
    @free_place -= amount if @free_place > 0 && amount < @free_place
    @taken_place += amount if @taken_place < @place
  end
end
