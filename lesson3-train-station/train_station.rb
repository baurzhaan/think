class Train
  attr_reader :name, :type, :wagon_count, :speed

  def initialize(name, type, wagon_count, route = nil)
    @name = name
    @type = type
    @wagon_count = wagon_count
    @speed = 0
    @route = route
    route.stations.first.add_train(self) if route
    @current_station = 0
  end

  def accelerate(value)
    @speed += value
  end

  def stop
    @speed = 0
  end

  def add_wagon
    @wagon_count += 1 if @speed == 0
  end

  def remove_wagon
    @wagon_count -= 1 if @speed == 0
  end

  def move_forward
    if @route && @current_station != @route.stations.index(@route.stations.last())
      @route.stations[@current_station].send_train(self)
      @current_station += 1
      @route.stations[@current_station].add_train(self)
    end
  end

  def move_backward
    if route && @current_station != route.stations.index(route.stations.first())
      route.stations[@current_station].send_train(self)
      @current_station -= 1
      route.stations[@current_station].add_train(self)
    end
  end

  def prev_current_next_stations
    stations_list = [@route.stations[@current_station]]
    @current_station < @route.stations.length - 1 ? stations_list << @route.stations[@current_station + 1] : stations_list << nil
    @current_station > 0 ? stations_list.insert(0, @route.stations[@current_station - 1]) : stations_list.insert(0, nil)
    stations_list
  end
end

##
class Station
  attr_accessor :name
  attr_reader :trains

  def initialize(name)
    self.name = name  # ВОПРОС: для присваивания значения instance variable принято использовать @name или метод-сеттер self.name= ?
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def train_list
    @trains.map { |train| train.name }
  end

  def train_list_by_type(type)
    @trains.map { |train| train.name if train.type == type }.select { |train| train != nil }
  end

  def send_train(train)
    @trains.delete(train)
  end
end

##
class Route
  attr_reader :start_station, :end_station, :stations
  
  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @stations = [start_station, end_station]
  end

  def add_station(station)
    self.stations.insert(-2, station)
  end

  def remove_station(station)
    if (station.name == start_station.name || station.name == end_station.name)
      puts "Вы не можете удалить начальную или конечную станцию!"
      return false
    end
    self.stations.delete(station) # Все еще не понимаю когда использовать self.station_list, а когда @station_list ??? Который вариант Ruby way?
  end
end