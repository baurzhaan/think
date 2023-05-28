# Имеет название, которое указывается при ее создании
class Station
  attr_accessor :name

  def initialize(name)
    self.name = name  # ВОПРОС: для присваивания значения instance variable принято использовать @name или метод-сеттер self.name= ? 
  end
end

# main

station1 = Station.new("Station1")

p station1
puts station1.name