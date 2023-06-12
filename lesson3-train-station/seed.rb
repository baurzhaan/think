require_relative "station"
require_relative "train"
require_relative "route"
require_relative "cargo_train"
require_relative "passenger_train"
require_relative "wagon"
require_relative "cargo_wagon"
require_relative "passenger_wagon"

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
