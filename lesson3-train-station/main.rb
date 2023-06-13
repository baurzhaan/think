require_relative "station"
require_relative "train"
require_relative "route"
require_relative "cargo_train"
require_relative "passenger_train"
require_relative "wagon"
require_relative "cargo_wagon"
require_relative "passenger_wagon"
require_relative "seed"

@stations = []
@trains = []
@routes = []

# seeding
@trains = seed_output[:trains]
@stations = seed_output[:stations]
@routes = seed_output[:routes]
# finish seeding

def create_station
  print "Введите наименование станции ('с' для отмены): "
  station_name = gets.chomp
  return if station_name == 'с'
  @stations << Station.new(station_name)
  @stations.last
end

def create_train
  print "Введите номер поезда ('с' для отмены): "
  train_name = gets.chomp
  return if train_name == 'с'

  loop do
    puts "(1) Пассажирский поезд"
    puts "(2) Грузовой поезд"
    type = gets.chomp.to_i

    case type
    when 1
      @trains << PassengerTrain.new(train_name)
      break
    when 2 
      @trains << CargoTrain.new(train_name)
      break
    else puts "Выберите тип поезда '1' или '2'"
    end
  end
  @trains.last
end

def create_route
  if @stations.length < 2
    puts "Для создания маршрута нужно минимально 2 станции!"
    return
  end

  stations = @stations[0..@stations.length]
  first_station, last_station = nil

  loop do
    puts "Выберите начальную станцию из списка"
    stations.each_index { |index| puts "(#{index + 1}) #{stations[index].name}" }
    station_index = gets.chomp.to_i - 1
    if station_index.between?(0, stations.length)
      first_station = stations[station_index]
      break
    end
    puts "Необходимо выбрать станцию из указанного диапазона!"
  end


  stations.delete(first_station)

  loop do
    puts "Выберите конечную станцию из списка"
    stations.each_index { |index| puts "(#{index + 1}) #{stations[index].name}" }
    station_index = gets.chomp.to_i - 1
    if station_index.between?(0, stations.length)
      last_station = stations[station_index]
      break
    end
    puts "Необходимо выбрать станцию из указанного диапазона!"
  end

  @routes << Route.new(first_station, last_station)
end

def add_station_to_route
  puts "Выберите маршрут из списка"
  @routes.each_index { |index| puts "(#{index + 1}) Начальная станция: #{@routes[index].stations.first.name} - Конечная станция: #{@routes[index].stations.last.name}" }
  route_index = gets.chomp.to_i - 1
  target_route = @routes[route_index]

  puts "Выберите станцию которую нужно добавить"
  @stations.each_index { |index| puts "(#{index + 1}) #{@stations[index].name}" }
  station_index = gets.chomp.to_i - 1
  target_station = @stations[station_index]
  target_route.add_station(target_station)

  target_route
end

def delete_station_in_route
  puts "Выберите маршрут из списка"
  @routes.each_index { |index| puts "(#{index + 1}) Начальная станция: #{@routes[index].stations.first.name} - Конечная станция: #{@routes[index].stations.last.name}" }
  route_index = gets.chomp.to_i - 1
  target_route = @routes[route_index]

  puts "Выберите станцию которую нужно удалить"
  target_route.stations.each_index { |index| puts "(#{index + 1}) #{@routes[route_index].stations[index].name}" }
  station_index = gets.chomp.to_i - 1
  target_station = @stations[station_index]
  target_route.remove_station(target_station)

  @routes
end

def assign_route_to_train
  puts "Выберите поезд"
  @trains.each_index { |index| puts "(#{index + 1}) #{@trains[index].name}" }
  train_index = gets.chomp.to_i - 1
  target_train = @trains[train_index]
  
  puts "Выберите маршрут из списка"
  @routes.each_index { |index| puts "(#{index + 1}) Начальная станция: #{@routes[index].stations.first.name} - Конечная станция: #{@routes[index].stations.last.name}" }
  route_index = gets.chomp.to_i - 1
  target_route = @routes[route_index]

  target_train.assign_route(target_route)
  target_train
end

def add_wagon_to_train
  puts "Выберите поезд"
  @trains.each_index { |index| puts "(#{index + 1}) #{@trains[index].name}" }
  train_index = gets.chomp.to_i - 1
  target_train = @trains[train_index]

  target_train.add_wagon
  target_train
end

def delete_wagon_from_train
  puts "Выберите поезд"
  @trains.each_index { |index| puts "(#{index + 1}) #{@trains[index].name}" }
  train_index = gets.chomp.to_i - 1
  
  target_train = train_index < @trains.length ? @trains[train_index] : nil

  target_train.remove_wagon if target_train
  target_train
end

def move_train_in_route

  puts "Выберите поезд"
  @trains.each_index { |index| puts "(#{index + 1}) #{@trains[index].name}" }
  train_index = gets.chomp.to_i - 1
  target_train = @trains[train_index]

  puts "Переместить вперед или назад по маршруту?"
  puts "(1) Вперед"
  puts "(2) Назад"
  forward = gets.chomp == '1' ? true : false

  if forward
    target_train.move_forward if target_train.route
  else
    target_train.move_backward if target_train.route
  end

  target_train
end

def list_stations
  @stations.map { |station| station.name }
end

def list_trains
  puts "Выберите станцию"
  @stations.each_index { |index| puts "(#{index + 1}) #{@stations[index].name}" }
  station_index = gets.chomp.to_i - 1
  target_station = @stations[station_index]

  target_station.trains.each { |train| puts train.name }
end

loop do
  puts "-----------------------"
  puts "Выберите действие (нажмите соответствующую цифру):"
  # puts "(1) Создать станцию"
  # puts "(2) Создать поезд"
  puts "(3) Создать маршрут"
  # puts "(4) Добавить станцию к маршуту"
  # puts "(5) Удалить станцию из маршрута"
  # puts "(6) Назначить маршрут к поезду"
  # puts "(7) Добавить вагон к поезду"
  # puts "(8) Отцепить вагон от поезда"
  # puts "(9) Переместить поезд по маршруту"
  # puts "(10) Просмотреть список станции"
  # puts "(11) Просмотреть список поездов на станции"
  puts "(0) Выход из программы"
  puts "(д) Проверка! Показать текущие значения объектов"
  puts "-----------------------"

  menu_key = gets.chomp

  case menu_key
  when "0"
    puts "Спасибо что использовали наш сервис"
    break
  # when "1"
  #   create_station
  # when "2"
  #   create_train
  when "3"
    create_route
  # when "4"
  #   add_station_to_route
  # when "5"
  #   delete_station_in_route
  # when "6"
  #   assign_route_to_train
  # when "7"
  #   add_wagon_to_train
  # when "8"
  #   delete_wagon_from_train
  # when "9"
  #   move_train_in_route
  # when "10"
  #   list_stations
  # when "11"
  #   puts "На станции нет поездов" if list_trains.length == 0
  when "д"
    puts "\nТекущий объект 'stations'"
    p @stations
    puts "\nТекущий объект 'routes'"
    p @routes
    puts "\nТекущий объект 'trains'"
    p @trains
  else
    puts "Введите корректное действие"
  end
end