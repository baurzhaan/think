class Station
  attr_accessor :name, :trains_list

  def initialize(name)
    self.name = name  # ВОПРОС: для присваивания значения instance variable принято использовать @name или метод-сеттер self.name= ?
    self.trains_list = []
  end

  def accept_train(train_name)
    self.trains_list << train_name
  end
end

# main

# ========== ПРОВЕРКА КЛАССА Station - НАЧАЛО ==========
station1 = Station.new("Station1")
puts "Наименование станции: #{station1.name}"
station1.accept_train("train1")
station1.accept_train("train2")
station1.accept_train("train3")
puts "Количество поездов на станции: #{station1.trains_list.length}"
puts "Список поездов в текущий момент: #{station1.trains_list}"
puts

station2 = Station.new("Station2")
puts "Наименование станции: #{station2.name}"
station2.accept_train("train1")
puts "Количество поездов на станции: #{station2.trains_list.length}"
puts "Список поездов в текущий момент: #{station2.trains_list}"
puts
# ========== ПРОВЕРКА КЛАССА Station - КОНЕЦ ==========