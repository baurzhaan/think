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