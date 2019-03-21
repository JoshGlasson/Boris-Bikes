require_relative 'bike'

class DockingStation
DEFAULT_CAPACITY = 20
attr_accessor :capacity
attr_reader :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    fail 'Docking station full' if full?
    bikes << bike
  end

  def release_bike
    bike_check = bikes.map { |bike| bike.working? }
      if empty?
        fail 'No bikes available'
      elsif bike_check.include?(true) == false
        fail 'No working bikes available'
      else
        working_bike_position = bike_check.find_index(true)
        return bikes.slice!(working_bike_position)
      end
  end

  def accept_fixed_bikes(fixed_bikes)
    while fixed_bikes.count > 0
      bikes << fixed_bikes.pop
    end
  end

private

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end

end
