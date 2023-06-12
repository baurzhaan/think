class Station
  attr_reader :trains, :name

  @@all_stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@all_stations << self
  end

  def add_train(train)
    trains << train
  end

  def trains_by_type(type)
    trains.select { |train| train.type == type }
  end

  def send_train(train)
    trains.delete(train)
  end

  def self.all_stations
    @@all_stations
  end
end