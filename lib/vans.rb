require_relative 'bike'
require_relative 'docking_station'
require_relative 'garage'

class Van

  attr_reader :broken_bikes
  attr_reader :bikes_to_deliver


  def initialize
    @broken_bikes = []
    @bikes_to_deliver = []
  end

  def collect_broken_bikes(bikes)
    broken_bike_check = bikes.map{ |bike| bike.working? }
    while broken_bike_check.include?(false) == true
      broken_bike_position = broken_bike_check.find_index(false)
      broken_bike_check.delete_at(broken_bike_position)
      broken_bikes << bikes.slice!(broken_bike_position)
      broken_bike_check = bikes.map{ |bike| bike.working? }
    end
    return @broken_bikes
  end

  def distributes_working_bikes(fixed_bikes)
    while fixed_bikes.count > 0
      @bikes_to_deliver << fixed_bikes.pop
    end
    return @bikes_to_deliver
  end

end
