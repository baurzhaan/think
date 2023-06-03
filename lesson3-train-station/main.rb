require_relative "PassengerTrain"
require_relative "CargoTrain"

train1 = Train.new("qq", 1)
p train1

cargo_train = CargoTrain.new("aa", 2)
p cargo_train
puts cargo_train.speed
cargo_train.accelerate(13)
puts cargo_train.speed
cargo_train.stop
puts cargo_train.speed
cargo_train.add_wagon
p cargo_train
cargo_train.accelerate(13)
cargo_train.add_wagon
puts cargo_train.wagon_count