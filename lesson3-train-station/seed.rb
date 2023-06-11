require_relative "Station"
require_relative "Train"
require_relative "Route"
require_relative "CargoTrain"
require_relative "PassengerTrain"
require_relative "Wagon"
require_relative "CargoWagon"
require_relative "PassengerWagon"

def seed_output
  stations = []
  trains = []
  routes = []

  (1..5).each do |number|
    stations << Station.new("Станция #{number.to_s}")
    trains << PassengerTrain.new("Поезд пасс #{number.to_s}")
    trains << CargoTrain.new("Поезд груз #{number.to_s}")
  end
  
  routes << Route.new(stations.first, stations.last)
  
  result = {
    stations: stations,
    trains: trains,
    routes: routes
  }
end
