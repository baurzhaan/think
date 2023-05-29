class Train
  attr_accessor :name, :type, :wagon_count, :speed

  def initialize(name, type, wagon_count)
    self.name = name
    self.type = type
    self.wagon_count = wagon_count
    self.speed = 0
  end

  def accelerate(value)
    self.speed += value
  end

  def stop
    self.speed = 0
  end

  def add_wagon
    self.wagon_count += 1 if self.speed == 0
  end

  def remove_wagon
    self.wagon_count -= 1 if self.speed == 0
  end
end