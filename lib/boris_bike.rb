class DockingStation
  attr_reader :dock

  def release_bike
    bike = Bike.new
  end

  def dock_bike(bike)
    @dock = []
    @dock << bike
  end
end

class Bike
  def working?
  end
end
