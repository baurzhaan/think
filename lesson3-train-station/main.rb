require_relative "Station"
require_relative "Train"
require_relative "Route"
require_relative "CargoTrain"
require_relative "PassengerTrain"
require_relative "Wagon"
require_relative "CargoWagon"
require_relative "PassengerWagon"

@stations = []
@trains = []
@routes = []

def create_station
  print "Введите наименование станции: "
  station_name = gets.chomp
  @stations << Station.new(station_name)
  @stations.last
end

def create_train
  print "Введите номер поезда: "
  train_name = gets.chomp
  print "Пассажирский поезд? (да/нет): "
  type = gets.chomp

  case type
  when 'да' || 'yes'
    @trains << PassengerTrain.new(train_name)
  when 'нет' || 'no'
    @trains << CargoTrain.new(train_name)
  else
    puts "Введите 'да/yes' или 'нет/no'"
  end
  @trains.last
end

def create_route
  if @stations.length < 2
    puts "Для создания маршрута нужно минимально 2 станции!"
    return
  end

  stations = @stations[0..@stations.length]

  puts "Выберите начальную станцию из списка"
  stations.each_index { |index| puts "(#{index + 1}) #{stations[index].name}" }
  station_index = gets.chomp.to_i - 1
  first_station = stations[station_index]

  stations.delete(first_station)

  puts "Выберите конечную станцию из списка"
  stations.each_index { |index| puts "(#{index + 1}) #{stations[index].name}" }
  station_index = gets.chomp.to_i - 1
  last_station = stations[station_index]

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

  target_train.class == CargoTrain ? target_train.add_wagon(CargoWagon.new) : target_train.add_wagon(PassengerWagon.new)
  p target_train
  target_train
end

def delete_wagon_from_train
  puts "Выберите поезд"
  @trains.each_index { |index| puts "(#{index + 1}) #{@trains[index].name}" }
  train_index = gets.chomp.to_i - 1
  target_train = @trains[train_index]

  @trains[train_index].remove_wagon
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
  @stations.each { |station| station.name }
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
  puts "(1) Создать станцию"
  puts "(2) Создать поезд"
  puts "(3) Создать маршрут"
  puts "(4) Добавить станцию к маршуту"
  puts "(5) Удалить станцию из маршрута"
  puts "(6) Назначить маршрут к поезду"
  puts "(7) Добавить вагон к поезду"
  puts "(8) Отцепить вагон от поезда"
  puts "(9) Переместить поезд по маршруту"
  puts "(10) Просмотреть список станции в маршруте"
  puts "(11) Просмотреть список поездов на станции"
  puts "(0) Выход из программы"
  puts "-----------------------"

  menu_key = gets.chomp

  case menu_key
  when "0"
    puts "Спасибо что использовали наш сервис"
    break
  when "1"
    create_station
  when "2"
    create_train
  when "3"
    create_route
  when "4"
    add_station_to_route
  when "5"
    delete_station_in_route
  when "6"
    assign_route_to_train
  when "7"
    add_wagon_to_train
  when "8"
    delete_wagon_from_train
  when "9"
    move_train_in_route
  when "10"
    puts list_stations
  when "11"
    p list_trains
  else
    puts "Введите корректное действие"
  end
end