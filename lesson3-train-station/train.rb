require_relative "wagon"
require_relative "passenger_wagon"
require_relative "cargo_wagon"

class Train
  attr_reader :name, :wagons, :speed, :route

  def initialize(name)
    @name = name
    @wagons = []
    @speed = 0
    @route = nil
  end

  def accelerate(value)
    @speed += value
  end

  def stop
    @speed = 0
  end

  def add_wagon(wagon)
    if (speed == 0)
      case self.class.to_s
      when "PassengerTrain" then wagons << PassengerWagon.new
      when "CargoTrain" then wagons << CargoWagon.new
      end
    end
  end

  def remove_wagon
    wagons.pop if speed == 0
  end

  def assign_route(route)
    @route = route
    Station.all_stations.each { |station| station.send_train(self) } # проверяем все станции и удаляем поезд оттуда если он там есть
    @route.stations.first.add_train(self)
    @station_index = 0
    @route
  end

  def move_forward
    if next_station
      current_station.send_train(self)
      @station_index += 1
      current_station.add_train(self)
    end
  end

  def move_backward
    if previous_station
      current_station.send_train(self)
      @station_index -= 1
      current_station.add_train(self)
    end
  end

  protected
  # все 3 метода ниже protected потому что в текущем виде они используется только как вспомогательные методы к методам move_forward и move_backward. Соответственно к ним нужен доступ только этим двум методам.

  # помещены в секцию protected (не private) потому что в дочерних классах к ним нужен доступ.

  def previous_station
    @route.stations[@station_index - 1] if @station_index > 0
  end

  def current_station
    @route.stations[@station_index]
  end

  def next_station
    @route.stations[@station_index + 1]
  end
end