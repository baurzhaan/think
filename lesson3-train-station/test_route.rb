require_relative "route"
require_relative "station"

# Класс Route (Маршрут): 
# Имеет начальную и конечную станцию, а также список промежуточных станций. 
# Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
puts "Начальная и конечная станции указываютсся при создании маршрута"
station1 = Station.new("Начальная станция")
stationx = Station.new("Конечная станция")
route1 = Route.new(station1, stationx)
puts route1.stations
puts

# Может добавлять промежуточную станцию в список
puts "Может добавлять промежуточную станцию в список"
station2 = Station.new("Станция №2")
route1.add_station(station2)
station3 = Station.new("Станция №3")
route1.add_station(station3)
puts route1.stations
puts

# Может удалять промежуточную станцию из списка
puts "Может удалять промежуточную станцию из списка"
route1.remove_station(station2)
puts route1.stations
puts

# Может выводить список всех станций по-порядку от начальной до конечной
puts "Может выводить список всех станций по-порядку от начальной до конечной"
puts route1.stations