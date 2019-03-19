require_relative "bike"
require_relative "docking_station"

class Vans
  attr_reader :broken_bikes
  attr_reader :bike
  def initialize
    @broken_bikes = []
  end

  def collect_broken_bikes
    @bike = Bike.new
    @bike.report_broken
    @broken_bikes << @bike
  end

  def distributes_working_bikes
    @bike = Bike.new
  end

end
