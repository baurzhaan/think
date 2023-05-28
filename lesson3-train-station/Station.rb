# Имеет название, которое указывается при ее создании
# Может принимать поезда (по одному за раз)

class Station
  attr_accessor :name, :trains_on_station

  def initialize(name)
    self.name = name  # ВОПРОС: для присваивания значения instance variable принято использовать @name или метод-сеттер self.name= ?
    self.trains_on_station = 0
  end

  def accept_train
    self.trains_on_station += 1
  end
end

# main

station1 = Station.new("Station1")
p station1
station1.accept_train
station1.accept_train
station1.accept_train
puts "Количество поездов на станции #{station1.name}: #{station1.trains_on_station}"

puts
station2 = Station.new("Station2")
p station2
station2.accept_train
puts "Количество поездов на станции #{station2.name}: #{station2.trains_on_station}"
