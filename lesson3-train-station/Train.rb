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

# ========== ПРОВЕРКА КЛАССА Train - НАЧАЛО ==========
# train1 = Train.new("train1", "passenger", 10)
# p train1
# puts "#{train1.train_id} это поезд типа #{train1.train_type} с #{train1.train_wagon_count} вагонами"
# puts "Скорость поезда - #{train1.speed}"
# puts "Количество вагонов - #{train1.train_wagon_count}"
# train1.add_wagon
# puts "Количество вагонов (попытка добавить вагон на скорости 0) - #{train1.train_wagon_count}"

# train1.accelerate(10)
# puts "Скорость поезда - #{train1.speed}"
# puts "Количество вагонов - #{train1.train_wagon_count}"
# train1.add_wagon
# puts "Количество вагонов (попытка добавить вагон на скорости) - #{train1.train_wagon_count}"

# train1.stop
# puts "Скорость поезда - #{train1.speed}"
# puts "Количество вагонов - #{train1.train_wagon_count}"
# train1.add_wagon
# puts "Количество вагонов (попытка добавить вагон после остановки) - #{train1.train_wagon_count}"
# puts

# train2 = Train.new("train2", "cargo", 20)
# p train2
# puts "#{train2.train_id} это поезд типа #{train2.train_type} с #{train2.train_wagon_count} вагонами"
# puts
# ========== ПРОВЕРКА КЛАССА Train - КОНЕЦ ==========