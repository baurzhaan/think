# Имеет название, которое указывается при ее создании
# Может принимать поезда (по одному за раз)
# Может возвращать список всех поездов на станции, находящиеся в текущий момент

class Station
  attr_accessor :name, :trains_on_station, :trains_list

  def initialize(name) # Имеет название, которое указывается при ее создании
    self.name = name  # ВОПРОС: для присваивания значения instance variable принято использовать @name или метод-сеттер self.name= ?
    self.trains_on_station = 0
    self.trains_list = []
  end

  def accept_train(train_name) # Может принимать поезда (по одному за раз)
    self.trains_on_station += 1
    self.trains_list << train_name
  end
end

# main

station1 = Station.new("Station1")
p station1
station1.accept_train("train1")
station1.accept_train("train2")
station1.accept_train("train3")
puts "Количество поездов на станции #{station1.name}: #{station1.trains_on_station}"
puts "Список поездов на станции #{station1.name}: #{station1.trains_list}"

puts
station2 = Station.new("Station2")
p station2
station2.accept_train("train1")
puts "Количество поездов на станции #{station2.name}: #{station2.trains_on_station}"
puts "Список поездов на станции #{station2.name}: #{station2.trains_list}"