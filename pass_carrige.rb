class PassCarrige < Carrige
  include Company

  attr_accessor :seats, :free_seats, :taken_seats

  def place_or_seat(seats)
    @seats = seats.to_i
    number_valid?(seats)
    @free_seats = @seats
    @taken_seats = 0
  end

  def take_seat
    @free_seats -= 1 if @free_seats > 0
    @taken_seats += 1 if @taken_seats < @seats
  end
end
