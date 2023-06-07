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
  train_name = gets.chomp.force_encoding('UTF-8')

  print "Пассажирский поезд? (да/нет): "
  type = gets.chomp.force_encoding('UTF-8').downcase

  case type
  when 'да' || 'yes'
    @trains << PassengerTrain.new(train_name)
    puts "Добавил пассажирский поезд"
  when 'нет' || 'no'
    @trains << CargoTrain.new(train_name)
    puts "Добавил грузовой поезд"
  else
    puts "Введите 'да' или 'нет'"
  end
  @trains.last
end

def create_route
  if @stations.length < 2
    puts "Для создания маршрута должно быть доступно 2 станции и больше. Сперва добавьте больше станции!"
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
  
  puts "Выберите станцию которую нужно добавить"
  @stations.each_index { |index| puts "(#{index + 1}) #{@stations[index].name}" }
  station_index = gets.chomp.to_i - 1
  @routes[route_index].add_station(@stations[station_index])

  @routes
end

def delete_station_in_route
  puts "Выберите маршрут из списка"
  @routes.each_index { |index| puts "(#{index + 1}) Начальная станция: #{@routes[index].stations.first.name} - Конечная станция: #{@routes[index].stations.last.name}" }
  route_index = gets.chomp.to_i - 1

  puts "Выберите станцию которую нужно удалить"
  @routes[route_index].stations.each_index { |index| puts "(#{index + 1}) #{@routes[route_index].stations[index].name}" }
  station_index = gets.chomp.to_i - 1
  @routes[route_index].remove_station(@routes[route_index].stations[station_index])
  
  @routes
end

def assign_route_to_train
  puts "Выберите поезд"
  @trains.each_index { |index| puts "(#{index + 1}) #{@trains[index].name}" }
  train_index = gets.chomp.to_i - 1
  
  puts "Выберите маршрут из списка"
  @routes.each_index { |index| puts "(#{index + 1}) Начальная станция: #{@routes[index].stations.first.name} - Конечная станция: #{@routes[index].stations.last.name}" }
  route_index = gets.chomp.to_i - 1

  @trains[train_index].assign_route(@routes[route_index])
  p @trains[train_index]
end

def add_wagon_to_the_train
  puts "Выберите поезд"
  @trains.each_index { |index| puts "(#{index + 1}) #{@trains[index].name}" }
  train_index = gets.chomp.to_i - 1

  if @trains[train_index].is_a? CargoTrain
    @trains[train_index].add_wagon(CargoWagon.new)
    puts "Добавил грузовой вагон"
  else
    @trains[train_index].add_wagon(PassengerWagon.new)
    puts "Добавил пассажирский вагон"
  end

  @trains[train_index]
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
    add_wagon_to_the_train
  when "8"
    puts "Просматриваю список станции в маршруте"
  when "9"
    puts "Просматриваю список поездов на станции"
  else
    puts "Введите корректное действие"
  end
end