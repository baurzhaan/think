require_relative "Train"

class Station
  attr_accessor :name
  attr_reader :trains

  def initialize(name)  # Имеет название, которое указывается при ее создании
    self.name = name  # ВОПРОС: для присваивания значения instance variable принято использовать @name или метод-сеттер self.name= ?
    @trains = []
  end

  def add_train(train)  # Может принимать поезда (по одному за раз)
    @trains << train
  end

  def train_list  # Может возвращать список всех поездов на станции, находящиеся в текущий момент
    @trains.map { |train| train.name }
  end

  def train_list_by_type(type)  # Может возвращать список поездов на станции по типу: кол-во грузовых, пассажирских
    @trains.map { |train| train.name if train.type == type }.select { |train| train != nil }
  end

  def send_train(train)
    @trains.delete(train)
  end
end

# main

# ========== ПРОВЕРКА КЛАССА Station - НАЧАЛО ==========
station1 = Station.new("Station1")
puts "Наименование станции: #{station1.name}"

train1 = Train.new("train1", "passenger", 10)
station1.add_train(train1)
train2 = Train.new("train2", "cargo", 20)
station1.add_train(train2)

puts "Список всех поездов: #{station1.train_list}"
puts "Список всех товарных поездов: #{station1.train_list_by_type("cargo")}"
puts "Список всех пассажирских поездов: #{station1.train_list_by_type("passenger")}"

puts "Список всех поездов: #{station1.train_list}"
station1.send_train(train1)
puts "Список всех поездов: #{station1.train_list}"

# ========== ПРОВЕРКА КЛАССА Station - КОНЕЦ ==========