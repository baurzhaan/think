require_relative "train"
require_relative "station"

# Класс Station (Станция): Имеет название, которое указывается при ее создании
puts "Класс Station (Станция): Имеет название, которое указывается при ее создании"
station1 = Station.new("Станция 1")
puts station1.name
puts

# Может принимать поезда (по одному за раз)
puts "Может принимать поезда (по одному за раз)"
train1 = Train.new("Поезд 1", "пассажирский", 10)
station1.add_train(train1)
train2 = Train.new("Поезд 2", "грузовой", 12)
station1.add_train(train2)
puts station1.trains
puts

# Может возвращать список всех поездов на станции, находящиеся в текущий момент
puts "Может возвращать список всех поездов на станции, находящиеся в текущий момент"
puts station1.trains
puts

# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
puts "Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских"
puts station1.trains_by_type("грузовой")
puts

# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
puts "Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции)."
puts "Список поездов до отправки поезда:"
puts station1.trains
station1.send_train(train1)
puts "Список поездов после отправки поезда:"
puts station1.trains
puts