require_relative "Station" 

class Route
  attr_reader :start_station, :end_station, :station_list
  
  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @station_list = [start_station, end_station]
  end

  def add_station(station)
    self.station_list.insert(-2, station)
  end

  def remove_station(station)
    if (station.name == start_station.name || station.name == end_station.name)
      puts "Вы не можете удалить начальную или конечную станцию!"
      return false
    end
    self.station_list.delete(station) # Все еще не понимаю когда использовать self.station_list, а когда @station_list ??? Который Ruby way?
  end
end

# ========== ПРОВЕРКА КЛАССА Route - НАЧАЛО ==========

station1 = Station.new("Station 1")
stationX = Station.new("Station X")
route1 = Route.new(station1, stationX)
puts "Станции по маршруту"
route1.station_list.each { |station| puts station.name }

puts

station2 = Station.new("Station 2")
route1.add_station(station2)
puts "Станции по маршруту"
route1.station_list.each { |station| puts station.name }

puts

station3 = Station.new("Station 3")
route1.add_station(station3)
puts "Станции по маршруту"
route1.station_list.each { |station| puts station.name }

puts

route1.remove_station(station1)
puts "Станции по маршруту"
route1.station_list.each { |station| puts station.name }

puts

route1.remove_station(station3)
puts "Станции по маршруту"
route1.station_list.each { |station| puts station.name }

puts

puts "Список станции по маршруту по порядку"
route1.station_list.each { |station| puts station.name }

# route1 = Route.new("station1", "stationX")
# puts "Начальная станция: #{route1.start_station}"
# puts "Конечная станция: #{route1.end_station}"
# puts "Список станции: #{route1.station_list}"
# puts

# ========== ПРОВЕРКА КЛАССА Route - КОНЕЦ ==========