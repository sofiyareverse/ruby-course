class PassTrain < Train
	include Company
  
  private

  attr_writer :carriges
  # add and remove protected from user action before checking if zero?
	def add_carrige!(carrige)
    @carriges << carrige
  end

  def remove_carrige!
    @carriges.pop
  end
end
