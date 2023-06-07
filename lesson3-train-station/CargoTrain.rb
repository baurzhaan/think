class CargoTrain < Train
  def initialize(name)
    super
  end

  def add_wagon(wagon)
    wagons << wagon if (speed == 0) && (wagon.class == CargoWagon)
  end
end