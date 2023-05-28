class Route
  attr_accessor :start_station, :end_station, :station_list
  
  def initialize(start_station, end_station)
    self.start_station = start_station
    self.end_station = end_station
    self.station_list = [start_station, end_station]
  end

  def add_interim_station(station_name)
    self.station_list.insert(-2, station_name)
  end

  def remove_interim_station(station_name)
    return if (station_name == start_station || station_name == end_station)
    self.station_list.delete(station_name) # Все еще не понимаю когда использовать self.station_list, а когда @station_list ??? Который Ruby way?
  end
end

# ========== ПРОВЕРКА КЛАССА Route - НАЧАЛО ==========
route1 = Route.new("station1", "stationX")
puts "Начальная станция: #{route1.start_station}"
puts "Конечная станция: #{route1.end_station}"
puts "Список станции: #{route1.station_list}"
puts

puts "Добавить станцию в список"
route1.add_interim_station("station2")
puts "Список станции: #{route1.station_list}"
puts "Добавить станцию в список"
route1.add_interim_station("station3")
puts "Список станции: #{route1.station_list}"
puts "Добавить станцию в список"
route1.add_interim_station("station4")
puts "Список станции: #{route1.station_list}"
puts

puts "Удалить станцию station3"
route1.remove_interim_station("station3")
puts "Список станции: #{route1.station_list}"
puts

puts "Удалить станцию stationX"
route1.remove_interim_station("stationX")
puts "Список станции: #{route1.station_list}"

puts "Список станции по порядку: "
puts route1.station_list
puts
# ========== ПРОВЕРКА КЛАССА Route - КОНЕЦ ==========