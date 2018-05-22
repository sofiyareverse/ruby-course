class PassTrain < Train
  include Company
  attr_accessor :seats, :free_seats, :taken_seats, :carriges

  def place_or_seat(seats)
    @seats = seats.to_i
    number_valid?(seats)
    @free_seats = @seats
		@taken_seats = 0
  end

  def add_carrige(carrige)
    add_carrige!(carrige)
  end

  def remove_carrige
    remove_carrige!
  end

  def take_seat
    @free_seats -= 1 if @free_seats > 0
    @taken_seats += 1 if @taken_seats < @seats
  end
end
