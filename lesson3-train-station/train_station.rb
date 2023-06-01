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
    if @route && @current_station != @route.stations.index(@route.stations.first())
      @route.stations[@current_station].send_train(self)
      @current_station -= 1
      @route.stations[@current_station].add_train(self)
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
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def trains_by_type(type)
    @trains.select { |train| train.type == type }
  end

  def send_train(train)
    @trains.delete(train)
  end
end

##
class Route
  attr_reader :stations
  
  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @stations = [start_station, end_station]
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def remove_station(station)
    if (station.name == @start_station.name || station.name == @end_station.name)
      puts "Вы не можете удалить начальную или конечную станцию!"
      return false
    end
    stations.delete(station) # Все еще не понимаю когда использовать self.station_list, а когда @station_list ??? Который вариант Ruby way?
  end
end

train1 = Train.new("train 1", "pass", 12)
train2 = Train.new("train 2", "pass", 12)
train3 = Train.new("train 3", "cargo", 12)
station1 = Station.new("Station 1")
station1.add_train(train1)
station1.add_train(train2)
station1.add_train(train3)
station1.trains.each { |train| puts train.name }

puts

station1.trains_by_type("pass").each { |train| puts train.name}


# puts "---- Train class test ----\n\n"

# puts "Station has name:"
# station1 = Station.new("Station 1")
# p station1
# puts

# puts "Station can accept single train:"
# train1 = Train.new("Train 1", "pass", 10)
# station1.add_train(train1)
# p station1
# puts

# puts "Station can return trains it has at the moment:"
# train2 = Train.new("Train 2", "cargo", 11)
# station1.add_train(train2)
# puts station1.trains
# puts

# puts "Station can return trains according to the type:"
# p station1.trains_by_type("cargo")
# puts

# puts "Station can dispatch single train, which means the train is removed from the list."
# puts "Trains on station before dispatch:"
# puts station1.trains
# puts "Trains on station after dispatch:"
# station1.send_train(train2)
# puts station1.trains
# puts

# puts "---- Route class test ----\n\n"

# puts "Route has start and end stations, and list of interim stations"
# puts "Start and end stations are set when Route is created"
# stationx = Station.new("Station X")
# route1 = Route.new(station1, stationx)
# puts route1
# puts

# puts "You can add interim stations"
# station2 = Station.new("Station 2")
# route1.add_station(station2)
# station3 = Station.new("Station 3")
# route1.add_station(station3)
# p route1
# puts

# puts "You can delete interim station"
# route1.remove_station(station2)
# p route1
# puts

# puts "You can list all stations"
# route1.stations.each { |station| puts station.name }
# puts

# puts "---- Train class test ----\n\n"

# puts "Train has number/name, type, and wagon number, which are assigned at creation time"
# train3 = Train.new("train 3", "cargo", 23)
# p train3
# puts

# puts "Train can accelerate"
# puts "Current speed: #{train3.speed}"
# train3.accelerate(12)
# puts "Accelerated speed: #{train3.speed}"
# puts

# puts "Train can return current speed"
# puts "Current speed: #{train3.speed}"
# puts

# puts "Train can stop -> set the speed to 0"
# puts "Current speed: #{train3.speed}"
# train3.stop()
# puts "Speed after stop: #{train3.speed}"

# puts "Train can return number of wagons"
# puts "Number of wagons: #{train3.wagon_count}"
# puts

# puts "Can add wagon by 1. Only when current speed is 0"
# puts "Number of wagons: #{train3.wagon_count}"
# train3.add_wagon
# puts "Number of wagons when I add one, speed is 0: #{train3.wagon_count}"
# train3.accelerate(1)
# train3.add_wagon
# puts "Number of wagons when I add one, speed is 1: #{train3.wagon_count}"
# puts

# puts "Train can accepts route, and"
# puts "When added to the route, train is automatically assigned to the first station in the route"
# route1.stations.first.trains.each { |train| puts train.name }
# train4 = Train.new("train 4", "cargo", 23, route1)
# route1.stations.first.trains.each { |train| puts train.name }
# p train4
# puts

# puts "Train can move back-and-forth in the route"
# train4.move_forward
# train4.move_forward
# train4.move_forward
# train4.move_forward
# train4.move_forward
# train4.move_forward
# train4.move_forward
# p route1

# train4.move_backward
# train4.move_backward
# train4.move_backward
# train4.move_backward
# train4.move_backward
# p route1