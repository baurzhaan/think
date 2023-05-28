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

class Train
  attr_accessor :train_id, :train_type, :train_wagon_count, :speed

  def initialize(train_id, train_type, train_wagon_count)
    self.train_id = train_id
    self.train_type = train_type
    self.train_wagon_count = train_wagon_count
    self.speed = 0
  end

  def accelerate(value)
    self.speed += value
  end

  def stop
    self.speed = 0
  end

  def add_wagon
    self.train_wagon_count += 1 if self.speed == 0
  end

  def remove_wagon
    self.train_wagon_count -= 1 if self.speed == 0
  end
end

# main

train1 = Train.new("train1", "passenger", 10)
p train1
puts "#{train1.train_id} это поезд типа #{train1.train_type} с #{train1.train_wagon_count} вагонами"
puts "Скорость поезда - #{train1.speed}"
puts "Количество вагонов - #{train1.train_wagon_count}"
train1.add_wagon
puts "Количество вагонов (попытка добавить вагон на скорости 0) - #{train1.train_wagon_count}"

train1.accelerate(10)
puts "Скорость поезда - #{train1.speed}"
puts "Количество вагонов - #{train1.train_wagon_count}"
train1.add_wagon
puts "Количество вагонов (попытка добавить вагон на скорости) - #{train1.train_wagon_count}"

train1.stop
puts "Скорость поезда - #{train1.speed}"
puts "Количество вагонов - #{train1.train_wagon_count}"
train1.add_wagon
puts "Количество вагонов (попытка добавить вагон после остановки) - #{train1.train_wagon_count}"
puts

train2 = Train.new("train2", "cargo", 20)
p train2
puts "#{train2.train_id} это поезд типа #{train2.train_type} с #{train2.train_wagon_count} вагонами"
puts

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
puts