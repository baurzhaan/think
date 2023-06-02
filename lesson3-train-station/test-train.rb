require_relative "train_station"

# Класс Train (Поезд):
# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
puts "Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов"
train1 = Train.new("Train No. 1", "passenger", 10)
puts train1.name, train1.type, train1.wagon_count
puts

# Может набирать скорость
puts "Может набирать скорость"
puts "Скорость до набора: #{train1.speed}"
train1.accelerate(23)
puts "Скорость после набора: #{train1.speed}"
puts

# Может возвращать текущую скорость
puts "Может возвращать текущую скорость"
puts "Текущая скорость: #{train1.speed}"
puts

# Может тормозить (сбрасывать скорость до нуля)
puts "Может тормозить (сбрасывать скорость до нуля)"
train1.stop()
puts "Текущая скорость: #{train1.speed}"
puts

# Может возвращать количество вагонов
puts "Может возвращать количество вагонов"
puts "Количество вагонов: #{train1.wagon_count}"
puts

# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). 
puts "Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов)."
train1.add_wagon()
puts "Прицепили один вагон. Количество вагонов: #{train1.wagon_count}"
train1.remove_wagon()
puts "Отцепили один вагон. Количество вагонов: #{train1.wagon_count}"
puts

# Прицепка/отцепка вагонов может осуществляться только если поезд не движется."
puts "Прицепка/отцепка вагонов может осуществляться только если поезд не движется."
train1.accelerate(1)
puts "Текущая скорость: #{train1.speed}"
puts "Количество вагонов: #{train1.wagon_count}"
puts "Попытались прицепить один вагон. Количество вагонов: #{train1.wagon_count}"
train1.add_wagon()
puts "Попытались отцепить один вагон. Количество вагонов: #{train1.wagon_count}"
train1.remove_wagon()
puts

# Может принимать маршрут следования (объект класса Route).
puts "Может принимать маршрут следования (объект класса Route)."
station1 = Station.new("First Station")
station1.add_train(train1)
stationx = Station.new("Last Station")
route1 = Route.new(station1, stationx)
train1.assign_route(route1)
p train1
puts

# При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
puts "При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте."
puts "Станция: #{route1.stations.first.name} -> Поезд: #{route1.stations.first.trains.first.name}"
puts

# Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
puts "Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз."
puts "До перемещения поезда #{train1.name}" 
puts "Станция: #{route1.stations.first.name} -> Поезд: #{route1.stations.first.trains.first.name}"
puts "Станция: #{route1.stations[1].name} -> Поезд: #{route1.stations[1].trains}"
train1.move_forward
puts "После перемещения поезда"
puts "Станция: #{route1.stations.first.name} -> Поезд: #{route1.stations.first.trains}"
puts "Станция: #{route1.stations[1].name} -> Поезд: #{route1.stations[1].trains.first.name}"
puts

# Возвращать предыдущую станцию на основе маршрута
puts "Предыдущая станция"
puts train1.previous_station.name
puts

# Возвращать текущую станцию на основе маршрута
puts "Текущая станция"
puts train1.current_station.name
puts

# Возвращать следующую станцию на основе маршрута
puts "Следующая станция"
p train1.next_station
puts

puts "Переместим поезд на одну станцию назад"
train1.move_backward
puts

# Возвращать предыдущую станцию на основе маршрута
puts "Предыдущая станция"
p train1.previous_station
puts

# Возвращать текущую станцию на основе маршрута
puts "Текущая станция"
puts train1.current_station.name
puts

# Возвращать следующую станцию на основе маршрута
puts "Следующая станция"
p train1.next_station.name
puts