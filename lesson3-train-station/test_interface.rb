require_relative "train"
require_relative "cargo_train"
require_relative "passenger_train"
require_relative "wagon"
require_relative "cargo_wagon"
require_relative "passenger_wagon"


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

