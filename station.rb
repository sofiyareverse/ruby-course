class Station
  attr_accessor :name
  attr_reader :name, :trains
  def initialize(name)
    @name = name
    @trains = []
  end

  def self.all
    self.map { |e| e }
  end

  def add_train(train)
    @trains << train
  end

  def remove_train(station, num)
    station.trains.delete_if { |t| t.number == num}
  end

  def trains_on_station
    @trains.map { |e| e.number }.first
  end

  def trains_type_on_station(train_type)
    @trains.select {|e| e.type == train_type}.count
  end
end
