require_relative "Train"
require_relative "CargoTrain"
require_relative "PassengerTrain"
require_relative "Wagon"
require_relative "CargoWagon"
require_relative "PassengerWagon"


common_train = Train.new("common train 1", 10)
common_wagon = Wagon.new
common_train.add_wagon(common_wagon)
p common_train

cargo_wagon = CargoWagon.new
passenger_wagon = PassengerWagon.new

cargo_train = CargoTrain.new("cargo train 1", 10)
cargo_train.add_wagon(cargo_wagon)
p cargo_train
cargo_train.add_wagon(passenger_wagon)
p cargo_train

passenger_train = PassengerTrain.new("passenger train 1", 10)
passenger_train.add_wagon(passenger_wagon)
p passenger_train
passenger_train.add_wagon(cargo_wagon)
p passenger_train

