class Train
  attr_reader :name, :type, :wagon_count, :speed

  def initialize(name, type, wagon_count)
    @name = name
    @type = type
    @wagon_count = wagon_count
    @speed = 0
  end

  def accelerate(value)
    @speed += value
  end

  def stop
    @speed = 0
  end

  def add_wagon
    @wagon_count += 1 if speed == 0
  end
  
  def remove_wagon
    @wagon_count -= 1 if speed == 0
  end

  def assign_route(route)
    @route = route
    Station.all_stations.each { |station| station.send_train(self) } # проверяем все станции и удаляем поезд оттуда если он там есть
    @route.stations.first.add_train(self)
    @station_index = 0
    @route
  end

  def move_forward
    if next_station
      current_station.send_train(self)
      @station_index += 1
      current_station.add_train(self)
    end
  end

  def move_backward
    if previous_station
      current_station.send_train(self)
      @station_index -= 1
      current_station.add_train(self)
    end
  end

  def previous_station
    @route.stations[@station_index - 1] if @station_index > 0
  end

  def current_station
    @route.stations[@station_index]
  end

  def next_station
    @route.stations[@station_index + 1]
  end
end

##
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

##
class Route
  attr_reader :stations
  
  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def remove_station(station)
    return false if (station == stations.first() || station == stations.last())
    stations.delete(station)
  end
end