class PassTrain < Train

  private

  attr_writer :carriges
  # add and remove protected from user action before checking if zero?
	def add_carrige!
    @carriges << PassCarrige.new
  end

  def remove_carrige!
    @carriges.pop
  end
end
